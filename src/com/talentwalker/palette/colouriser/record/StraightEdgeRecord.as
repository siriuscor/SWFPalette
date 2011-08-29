//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser.record {
    import com.talentwalker.palette.colouriser.*;
    import com.talentwalker.palette.alloctaor.*;
    import com.talentwalker.palette.BitArray;

    public class StraightEdgeRecord implements Resettable {

        public static function readQuick(_arg1:BitArray=null, _arg2:ParseState=null):void{
            _arg1.readBits(2, false);
            var _local3:int = (_arg1.readBits(4, false) + 2);
            if (_arg1.readBits(1, false) != 0){
                _arg1.readBits((_local3 * 2), true);
            } else {
                _arg1.readBits(1, false);
                _arg1.readBits(_local3, true);
            };
        }

        public function read(_arg1:BitArray=null, _arg2:ParseState=null):void{
            _arg1.readBits(2, false);
            var _local3:int = (_arg1.readBits(4, false) + 2);
            if (_arg1.readBits(1, false) != 0){
                _arg1.readBits((_local3 * 2), true);
            } else {
                _arg1.readBits(1, false);
                _arg1.readBits(_local3, true);
            };
        }

    }
}
