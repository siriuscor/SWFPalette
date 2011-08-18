//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser {
    import com.talentwalker.palette.alloctaor.*;
    import com.talentwalker.palette.BitArray;

    public class SetBackgroundColor extends MovieObject {

        override public function read(_arg1:BitArray=null, _arg2:ParseState=null):void{
            super.read(_arg1, _arg2);
            Allocator.alloc(RGBColor).read(_arg1, _arg2);
        }

    }
}//package com.mindcandy.utils.colouriser 
