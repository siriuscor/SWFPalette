//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser.line {
    import com.talentwalker.palette.colouriser.*;
    import com.talentwalker.palette.alloctaor.*;
    import com.talentwalker.palette.colouriser.fillstyle.*;
    import com.talentwalker.palette.BitArray;

    public class SolidLine2 implements Resettable {

        public function read(_arg1:BitArray=null, _arg2:ParseState=null):void{
            _arg1.readWord(2, false);
            _arg1.readBits(2, false);
            var _local3:int = _arg1.readBits(2, false);
            var _local4:int = _arg1.readBits(1, false);
            _arg1.readBits(11, false);
            if (_local3 == 2){
                _arg1.readWord(2, false);
            };
            if (_local4 == 0){
                Allocator.alloc(RGBColor).read(_arg1, _arg2);
            } else {
                if (_local4 == 1){
                    switch (_arg1.scanWord(1, false)){
                        case FillStyle.Solid:
                            Allocator.alloc(SolidFill).read(_arg1, _arg2);
                            break;
                        case FillStyle.Linear:
                            Allocator.alloc(GradientFill).read(_arg1, _arg2);
                            break;
                        case FillStyle.Radial:
                            Allocator.alloc(GradientFill).read(_arg1, _arg2);
                            break;
                        case FillStyle.Tiled:
                            Allocator.alloc(BitmapFill).read(_arg1, _arg2);
                            break;
                        case FillStyle.Clipped:
                            Allocator.alloc(BitmapFill).read(_arg1, _arg2);
                            break;
                        case FillStyle.UnsmoothedTiled:
                            Allocator.alloc(BitmapFill).read(_arg1, _arg2);
                            break;
                        case FillStyle.UnsmoothedClipped:
                            Allocator.alloc(BitmapFill).read(_arg1, _arg2);
                            break;
                    };
                };
            };
        }

    }
}
