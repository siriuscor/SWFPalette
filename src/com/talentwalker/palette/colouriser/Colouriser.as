//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser {
    import flash.utils.*;
    import com.talentwalker.palette.colourscheme.*;
    import flash.events.*;
    import flash.display.*;
    import com.talentwalker.palette.alloctaor.*;
    import flash.net.*;
    import com.talentwalker.palette.colouriser.defineobject.*;
    import flash.system.*;
    import com.talentwalker.palette.BitArray;

    public class Colouriser extends EventDispatcher {

        private static const MAX_WORKLOAD_SIZE:int = 100;

        private var stream:URLStream;
        private var swfData:BitArray;
        private var url:String;
        private var loader:Loader;
        private var workloadSize:Number;
        private var parseState:ParseState;
        private var currentTime:int;
        private var colorScheme:ColourScheme;
        private var currentColourIndex:int;
        private var preDecode:int;
        private var allowedFrameDrop:uint;
        private var colouriserIndex:ColouriserIndex;
        private var stage:Stage;

        public function Colouriser(_arg1:Stage){
            this.stage = _arg1;
        }
        public function getBitArray():BitArray{
            return (this.swfData);
        }
        public function colourise(_arg1:BitArray, _arg2:ColourScheme, _arg3:ColouriserIndex=null):void{
            prepareColourise(_arg1, _arg2);
            if (_arg3 == null){
                this.colouriserIndex = new ColouriserIndex();
                this.parseState.setBuildColouriserIndex(true);
            } else {
                this.colouriserIndex = _arg3;
                this.parseState.setBuildColouriserIndex(false);
            };
            parseState.setColouriserIndex(this.colouriserIndex);
            this.preDecode = getTimer();
            this.currentTime = getTimer();
            if (parseState.getBuildColouriserIndex()){
            } else {
                this.currentColourIndex = 0;
            };
            this.stage.addEventListener(Event.ENTER_FRAME, this.handleOnEnterFrame, false, 0, false);
        }
        public function getColouriserIndex():ColouriserIndex{
            return (colouriserIndex);
        }
        private function colouriseUnindexedSlice():Boolean{
            return (this.decodeObject(this.swfData));
        }
        private function decodeObject(_arg1:BitArray):Boolean{
            var _local2 = (_arg1.scanWord(2, false) >> 6);
            var _local3 = (_arg1.scanWord(2, false) & 63);
            var _local4:int = ((_arg1.getPointer() + 16) + (_local3 << 3));
            if (_local2 == 0){
                _arg1.setPointer(_local4);
                return (false);
            };
            if (_local3 == 63){
                _arg1.adjustPointer(16);
                _local3 = _arg1.scanWord(4, false);
                _local4 = ((_arg1.getPointer() + 32) + (_local3 << 3));
                _arg1.adjustPointer(-16);
            };
            switch (_local2){
                case MovieObject.DefineShape:
                    Allocator.alloc(DefineShape).read(_arg1, parseState);
                    break;
                case MovieObject.DefineShape2:
                    Allocator.alloc(DefineShape2).read(_arg1, parseState);
                    break;
                case MovieObject.DefineShape3:
                    Allocator.alloc(DefineShape3).read(_arg1, parseState);
                    break;
                case MovieObject.DefineShape4:
                    Allocator.alloc(DefineShape4).read(_arg1, parseState);
                    break;
                case MovieObject.DefineMorphShape:
                    Allocator.alloc(DefineMorphShape).read(_arg1, parseState);
                    break;
                case MovieObject.DefineMorphShape2:
                    Allocator.alloc(DefineMorphShape2).read(_arg1, parseState);
                    break;
                case MovieObject.SetBackgroundColor:
                    Allocator.alloc(SetBackgroundColor).read(_arg1, parseState);
                    break;
                case MovieObject.DefineSprite:
                    Allocator.alloc(DefineSprite).read(_arg1, parseState);
                    break;
            };
            _arg1.setPointer(_local4);
            return (true);
        }
        public function colouriseUrl(_arg1:String, _arg2:ColourScheme, _arg3:ColouriserIndex=null):void{
            var url:* = _arg1;
            var colorScheme:* = _arg2;
            var colouriserIndex = _arg3;
            this.loader = loader;
            this.colorScheme = colorScheme;
            this.url = url;
            this.colouriserIndex = colouriserIndex;
            this.allowedFrameDrop = 2;
            var request:* = new URLRequest(url);
            this.stream = new URLStream();
            stream.endian = Endian.LITTLE_ENDIAN;
            stream.addEventListener(Event.COMPLETE, handleSwfLoadComplete, false, 0, false);
            try {
                stream.load(request);
            } catch(error:Error) {
                this.dispatchEvent(new ColouriserEvent(ColouriserEvent.COLOURISE_ERROR));
            };
        }
        private function handleColouredBytesReady(_arg1:Event):void{
            this.removeEventListener(ColouriserEvent.COLOURED_BYTES_READY, this.handleColouredBytesReady);
            this.loader = new Loader();
            var _local2:LoaderContext = new LoaderContext();
            if (ColouredDomainManager.getInstance().useNewDomain()){
                _local2.applicationDomain = new ApplicationDomain();
                ColouredDomainManager.getInstance().putDefinition(loader);
            } else {
                _local2.applicationDomain = ApplicationDomain.currentDomain;
            };
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, clipLoadComplete, false, 0, false);
            loader.loadBytes(this.swfData, _local2);
        }
        private function handleOnEnterFrame(_arg1:Event):void{
            var _local5:int;
            var _local6:int;
            if (parseState.getBuildColouriserIndex()){
                _local5 = 0;
                while (_local5 < this.workloadSize) {
                    if (!colouriseUnindexedSlice()){
                        this.handleColouriseComplete();
                        return;
                    };
                    _local5++;
                };
            } else {
                _local6 = 0;
                while (_local6 < this.workloadSize) {
                    if (!colouriseIndexedSlice()){
                        this.handleColouriseComplete();
                        return;
                    };
                    _local6++;
                };
            };
            var _local2:int = (getTimer() - currentTime);
            var _local3:int = this.stage.frameRate;
            var _local4:Number = ((1 / _local3) * 1000);
            if (_local2 > (_local4 * allowedFrameDrop)){
                this.workloadSize = (this.workloadSize - 10);
                if (this.workloadSize < 1){
                    this.workloadSize = 1;
                };
            } else {
                this.workloadSize = (this.workloadSize * 2);
            };
            this.currentTime = getTimer();
        }
        private function handleSwfLoadComplete(_arg1:Event):void{
            stream.removeEventListener(Event.COMPLETE, handleSwfLoadComplete);
            var _local2:BitArray = new BitArray();
            stream.readBytes(_local2);
            this.addEventListener(ColouriserEvent.COLOURED_BYTES_READY, this.handleColouredBytesReady, false, 0, false);
            this.colourise(_local2, this.colorScheme, this.colouriserIndex);
        }
        private function clipLoadComplete(_arg1:Event):void{
            loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, clipLoadComplete);
            var _local2:LoaderInfo = LoaderInfo(_arg1.target.loader.contentLoaderInfo);
            var _local3:DisplayObjectContainer = (_local2.content as DisplayObjectContainer);
            this.dispatchEvent(new ColouriserEvent(ColouriserEvent.COLOURISE_COMPLETE, _local3, swfData, this.loader, this.url));
        }
        public function setWorkloadSize(_arg1:Number):void{
            this.workloadSize = _arg1;
        }
        private function prepareColourise(_arg1:BitArray, _arg2:ColourScheme):void{
            var _local9:int;
            this.swfData = _arg1;
            this.parseState = new ParseState();
            parseState.setExtendedArray(false);
            parseState.setColorScheme(_arg2);
            var _local3:String = this.swfData.readString(3);
            var _local4:int = this.swfData.readWord(1, false);
            var _local5:int = this.swfData.readWord(4, false);
            this.swfData.position = (this.swfData.getPointer() >>> 3);
            var _local6:BitArray = new BitArray();
            this.swfData.readBytes(_local6);
            if (_local3 == "CWS"){
                _local9 = getTimer();
                _local6.uncompress();
                _local6.position = 0;
                _local6.setPointer(0);
                _local6.readBytes(this.swfData, 8);
                this.swfData.position = 0;
                this.swfData.writeByte(70);
                this.swfData.writeByte(87);
                this.swfData.writeByte(83);
            };
            this.swfData.position = 8;
            this.swfData.setPointer((this.swfData.position << 3));
            Allocator.alloc(Bounds).read(this.swfData, parseState);
            var _local7:int = this.swfData.readFixedWord(8, 8);
            var _local8:int = this.swfData.readWord(2, false);
            Allocator.allocCount = 0;
            this.workloadSize = MAX_WORKLOAD_SIZE;
        }
        private function handleColouriseComplete():void{
            this.stage.removeEventListener(Event.ENTER_FRAME, this.handleOnEnterFrame);
            this.dispatchEvent(new ColouriserEvent(ColouriserEvent.COLOURED_BYTES_READY));
        }
        public function setAllowedFrameDrop(_arg1:uint):void{
            if (_arg1 > 0){
                this.allowedFrameDrop = _arg1;
            };
        }
        private function colouriseIndexedSlice():Boolean{
            var _local1:Array = colouriserIndex.getBitPositions();
            var _local2:Array = colouriserIndex.getTransparencyFlags();
            var _local3:RGBColor = new RGBColor();
            this.swfData.setPointer(_local1[currentColourIndex]);
            parseState.setAlpha(_local2[currentColourIndex]);
            this.currentColourIndex++;
            _local3.read(this.swfData, parseState);
            return ((currentColourIndex < _local1.length));
        }

    }
}//package com.mindcandy.utils.colouriser 
