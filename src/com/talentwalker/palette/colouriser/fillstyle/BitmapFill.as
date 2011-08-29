//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser.fillstyle {
    import com.talentwalker.palette.colouriser.*;
    import com.talentwalker.palette.alloctaor.*;
    import com.talentwalker.palette.BitArray;

    public class BitmapFill extends FillStyle {

        override public function read(_arg1:BitArray=null, _arg2:ParseState=null):void{
            super.read(_arg1, _arg2);
            _arg1.readWord(2, false);
            Allocator.alloc(CoordTransform).read(_arg1, _arg2);
        }

    }
}
