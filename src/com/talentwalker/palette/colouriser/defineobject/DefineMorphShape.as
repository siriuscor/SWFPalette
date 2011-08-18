//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser.defineobject {
    import com.talentwalker.palette.colouriser.*;
    import com.talentwalker.palette.alloctaor.*;
    import com.talentwalker.palette.BitArray;

    public class DefineMorphShape extends DefineObject {

        override public function read(_arg1:BitArray=null, _arg2:ParseState=null):void{
            super.read(_arg1, _arg2);
            _arg2.setAlpha(true);
            _arg2.setDefineShape(this);
            _arg2.setExtendedArray(true);
            Allocator.alloc(Bounds).read(_arg1, _arg2);
            Allocator.alloc(Bounds).read(_arg1, _arg2);
            _arg1.readWord(4, false);
            Allocator.alloc(FillStyleArray).read(_arg1, _arg2);
            Allocator.alloc(LineStyleArray).read(_arg1, _arg2);
            var _local3:Shape = (Allocator.alloc(Shape) as Shape);
            _local3.read(_arg1, _arg2);
            _local3.read(_arg1, _arg2);
            _arg2.setAlpha(false);
            _arg2.setExtendedArray(false);
        }

    }
}//package com.mindcandy.utils.colouriser.defineobject 
