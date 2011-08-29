//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser {
    import com.talentwalker.palette.alloctaor.*;
    import com.talentwalker.palette.BitArray;

    public class MovieObject implements Resettable {

        public static var DefineSprite:int = 39;
        public static var DefineShape3:int = 32;
        public static var DefineShape4:int = 83;
        public static var SetBackgroundColor:int = 9;
        public static var DefineMorphShape:int = 46;
        public static var DefineShape:int = 2;
        public static var DefineShape2:int = 22;
        public static var DefineMorphShape2:int = 84;

        public function read(_arg1:BitArray=null, _arg2:ParseState=null):void{
            var _local3 = (_arg1.scanWord(2, false) & 63);
            _arg1.setPointer((_arg1.getPointer() + 16));
            if (_local3 == 63){
                _local3 = _arg1.readWord(4, false);
            };
        }

    }
}
