//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser.record {
    import com.talentwalker.palette.colouriser.*;
    import com.talentwalker.palette.alloctaor.*;
    import com.talentwalker.palette.BitArray;

    public class CurvedEdgeRecord implements Resettable {

        public static function readQuick(_arg1:BitArray, _arg2:ParseState):void{
            _arg1.readBits(2, false);
            _arg1.readBits(((_arg1.readBits(4, false) + 2) * 4), true);
        }

        public function read(_arg1:BitArray=null, _arg2:ParseState=null):void{
            _arg1.readBits(2, false);
            var _local3:int = (_arg1.readBits(4, false) + 2);
            _arg1.readBits((_local3 * 4), true);
        }

    }
}//package com.mindcandy.utils.colouriser.record 
