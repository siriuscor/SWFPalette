//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser {
    import com.talentwalker.palette.alloctaor.*;
    import com.talentwalker.palette.colouriser.defineobject.*;
    import com.talentwalker.palette.colouriser.line.*;
    import com.talentwalker.palette.BitArray;

    public class LineStyleArray implements Resettable {

        public function read(_arg1:BitArray=null, _arg2:ParseState=null):void{
            var _local3:int = _arg1.readWord(1, false);
            if (((_arg2.getExtendedArray()) && ((_local3 == 0xFF)))){
                _local3 = _arg1.readWord(2, false);
            };
            var _local4:int;
            while (_local4 < _local3) {
                if ((_arg2.getDefineShape() is DefineShape4)){
                    Allocator.alloc(SolidLine2).read(_arg1, _arg2);
                } else {
                    if ((_arg2.getDefineShape() is DefineMorphShape)){
                        Allocator.alloc(MorphSolidLine).read(_arg1, _arg2);
                    } else {
                        if ((_arg2.getDefineShape() is DefineMorphShape2)){
                            Allocator.alloc(MorphSolidLine2).read(_arg1, _arg2);
                        } else {
                            Allocator.alloc(SolidLine).read(_arg1, _arg2);
                        };
                    };
                };
                _local4++;
            };
        }

    }
}//package com.mindcandy.utils.colouriser 
