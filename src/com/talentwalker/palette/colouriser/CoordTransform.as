//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser {
    import com.talentwalker.palette.alloctaor.*;
    import com.talentwalker.palette.BitArray;

    public class CoordTransform implements Resettable {

        public function read(_arg1:BitArray=null, _arg2:ParseState=null):void{
            var _local6:int;
            var _local7:int;
            _arg1.alignToByte();
            var _local3:Boolean = ((_arg1.readBits(1, false))!=0) ? true : false;
            if (_local3){
                _local6 = _arg1.readBits(5, false);
                _arg1.readFixedBits(_local6, 16);
                _arg1.readFixedBits(_local6, 16);
            };
            var _local4:Boolean = ((_arg1.readBits(1, false))!=0) ? true : false;
            if (_local4){
                _local7 = _arg1.readBits(5, false);
                _arg1.readFixedBits(_local7, 16);
                _arg1.readFixedBits(_local7, 16);
            };
            var _local5:int = _arg1.readBits(5, false);
            _arg1.readBits(_local5, true);
            _arg1.readBits(_local5, true);
            _arg1.alignToByte();
        }

    }
}
