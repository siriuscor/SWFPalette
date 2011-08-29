//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser.fillstyle {
    import com.talentwalker.palette.colouriser.*;
    import com.talentwalker.palette.alloctaor.*;
    import com.talentwalker.palette.BitArray;

    public class FocalGradientFill extends FillStyle {

        override public function read(_arg1:BitArray=null, _arg2:ParseState=null):void{
            super.read(_arg1, _arg2);
            Allocator.alloc(CoordTransform).read(_arg1, _arg2);
            var _local3:int = _arg1.readWord(1, false);
            var _local4:int;
            while (_local4 < _local3) {
                Allocator.alloc(Gradient).read(_arg1, _arg2);
                _local4++;
            };
            _arg1.readBits(16, false);
        }

    }
}
