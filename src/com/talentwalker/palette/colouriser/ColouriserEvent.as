//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser {
    import flash.events.*;
    import flash.display.*;
    import com.talentwalker.palette.BitArray;

    public class ColouriserEvent extends Event {

        public static const COLOURISE_ERROR:String = "colouriseError";
        public static const COLOURISE_COMPLETE:String = "colouriseComplete";
        public static const COLOURED_BYTES_READY:String = "colouredBytesReady";

        private var displayObject:DisplayObject;
        private var bitArray:BitArray;
        private var url:String;
        private var loader:Loader;

        public function ColouriserEvent(_arg1:String, _arg2:DisplayObject=null, _arg3:BitArray=null, _arg4:Loader=null, _arg5:String=null, _arg6:Boolean=false, _arg7:Boolean=false){
            super(_arg1, _arg6, _arg7);
            this.displayObject = _arg2;
            this.bitArray = _arg3;
            this.url = _arg5;
            this.loader = _arg4;
        }
        public function getBitArray():BitArray{
            return (bitArray);
        }
        public function getDisplayObject():DisplayObject{
            return (displayObject);
        }
        public function getLoader():Loader{
            return (loader);
        }
        public function getUrl():String{
            return (url);
        }
        override public function clone():Event{
            return (new ColouriserEvent(this.type, this.displayObject, this.bitArray, this.loader, this.url, this.bubbles, this.cancelable));
        }

    }
}
