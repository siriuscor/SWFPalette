//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser {
    import com.talentwalker.palette.alloctaor.*;
    import com.talentwalker.palette.BitArray;

    public class FillStyle implements Resettable {

        public static var FocalRadial:int = 19;
        public static var Linear:int = 16;
        public static var Radial:int = 18;
        public static var Solid:int = 0;
        public static var UnsmoothedTiled:int = 66;
        public static var UnsmoothedClipped:int = 67;
        public static var Tiled:int = 64;
        public static var Clipped:int = 65;

        private var type:int;

        public function getType():int{
            return (type);
        }
        public function read(_arg1:BitArray=null, _arg2:ParseState=null):void{
            this.type = _arg1.readWord(1, false);
        }

    }
}//package com.mindcandy.utils.colouriser 
