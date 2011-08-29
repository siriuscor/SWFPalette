//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser.defineobject {
    import com.talentwalker.palette.colouriser.*;
    import com.talentwalker.palette.alloctaor.*;
    import com.talentwalker.palette.BitArray;

    public class DefineShape4 extends DefineObject {

        override public function read(_arg1:BitArray=null, _arg2:ParseState=null):void{
            super.read(_arg1, _arg2);
            _arg2.setAlpha(true);
            _arg2.setDefineShape(this);
            Allocator.alloc(Bounds).read(_arg1, _arg2);
            Allocator.alloc(Bounds).read(_arg1, _arg2);
            _arg1.readBits(8, false);
            Allocator.alloc(ShapeWithStyle).read(_arg1, _arg2);
            _arg2.setAlpha(false);
        }

    }
}
