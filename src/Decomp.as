package
{
    import com.talentwalker.palette.alloctaor.*;
    import com.talentwalker.palette.colouriser.*;
    import com.talentwalker.palette.colouriser.defineobject.*;
    import com.talentwalker.palette.colouriser.line.*;
    
    import flash.display.Loader;
    import flash.display.Sprite;
    import flash.events.*;
    import flash.net.*;
    import flash.system.*;
    import flash.utils.*;
    import com.talentwalker.palette.PaletteBuilder;
    import com.talentwalker.palette.PaletteChanger;
    import com.talentwalker.palette.SwfUncompresser;
    import com.talentwalker.palette.BitArray;
    
    public class Decomp extends Sprite
    {
        public var bytes:BitArray;
        public function Decomp()
        {
//            var a:uint = -1 << 24; 
//            trace(a);
            bytes = new BitArray();
//            load("avatar.swf");
            load("m_bear.swf");
            
           
//            var builder:PaletteBuilder = new PaletteBuilder();
//            builder.loadBytes(bytes);
//            var palette:Object = builder.buildPalette();
            
            //==========seperate=====
            /*
            var changer = new PaletteChanger();
            changer.loadPalette(palette);
            changer.loadBytes(bytes);
            changer.replace(123,456);
            bytes = changer.apply();
            */
            
        }
        
        public function load(url:String){ 
//            var colorScheme:* = _arg2;
//            var colouriserIndex = _arg3;
            var loader:URLLoader = loader;
//            this.colorScheme = colorScheme;
//            this.url = url;
//            this.colouriserIndex = colouriserIndex;
//            this.allowedFrameDrop = 2;
            var request:URLRequest = new URLRequest(url);
            var stream:URLStream = new URLStream();
            stream.endian = Endian.LITTLE_ENDIAN;
            stream.addEventListener(Event.COMPLETE, handleSwfLoadComplete, false, 0, false);
            try {
                stream.load(request);
            } catch(error:Error) {
                trace(error);
//                this.dispatchEvent(new ColouriserEvent(ColouriserEvent.COLOURISE_ERROR));
            };
        }
        
        public function handleSwfLoadComplete(e:Event) {
            var stream = e.currentTarget;
//            stream.removeEventListener(Event.COMPLETE, handleSwfLoadComplete);
//            var bytes:BitArray = new BitArray();
            stream.readBytes(bytes);
            
            bytes = process(bytes);
            
            var loader:Loader = new Loader();
            stage.addChild(loader);
            loader.loadBytes(bytes);
        }
        
        public function process(bytes:BitArray) {
            
            var palette = PaletteBuilder.build(bytes);
            trace(palette);
            
            var changer = new PaletteChanger(bytes);
            changer.loadPalette(palette);
//            changer.replace(0x009317E9,0xFF0000FF);
//            changer.replace(0xC43916FF,0xFF0000FF);
            changer.replace(0xFFCF03,0x000000);
            changer.replace(0x8E4A11,0xFF0000);
            bytes = changer.apply();
            
            return bytes;
            var echo;
            bytes = SwfUncompresser.uncompress(bytes) as BitArray;
            bytes.position = 8;
            bytes.setPointer(bytes.position << 3);
            
//            echo = bytes.readInt();
//            bytes.setPointer( bytes.position << 3);
//            
            Allocator.alloc(Bounds).read(bytes);
            echo = bytes.readFixedWord(8,8);
            echo = bytes.readWord(2, false);
            
            while(decodeObject(bytes)){
                
            }
            
//            printBytes(bytes);
            
            return bytes;
        }
        
        private function decodeObject(_arg1:BitArray):Boolean{
            var parseState:ParseState = new ParseState();
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
        
        public function printBytes(b:ByteArray) {
            var a:int ;
            try{
            while(true){
                a = b.readByte() & 0xFF;
                trace(a.toString(16));
            }
            }catch(e){
                trace(e);
                b.position = 0;
                return;
            }
        }
    }
}