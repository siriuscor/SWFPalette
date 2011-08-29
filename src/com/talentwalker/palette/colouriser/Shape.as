//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser {
    import com.talentwalker.palette.alloctaor.*;
    import com.talentwalker.palette.colouriser.record.*;
    import com.talentwalker.palette.BitArray;

    public class Shape implements Resettable {

        public function read(_arg1:BitArray=null, _arg2:ParseState=null):void{
            var _local3:int;
            _arg2.setNumFillBits(_arg1.readBits(4, false));
            _arg2.setNumLineBits(_arg1.readBits(4, false));
            while ((_local3 = _arg1.scanBits(6, false)) > 0) {
                if ((_local3 & 32) > 0){
                    if ((_local3 & 16) > 0){
                        StraightEdgeRecord.readQuick(_arg1, _arg2);
                    } else {
                        CurvedEdgeRecord.readQuick(_arg1, _arg2);
                    };
                } else {
                    StyleChangeRecord.readQuick(_arg1, _arg2);
                };
            };
            _arg1.adjustPointer(6);
            _arg1.alignToByte();
        }

    }
}
