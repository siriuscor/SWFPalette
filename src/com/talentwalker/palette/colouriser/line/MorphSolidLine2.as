//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser.line {
    import com.talentwalker.palette.colouriser.*;
    import com.talentwalker.palette.alloctaor.*;
    import com.talentwalker.palette.colouriser.defineobject.*;
    import com.talentwalker.palette.colouriser.fillstyle.*;
    import com.talentwalker.palette.BitArray;

    public class MorphSolidLine2 implements Resettable {

        public function read(_arg1:BitArray=null, _arg2:ParseState=null):void{
            var _local5:Boolean;
            _arg1.readWord(4, false);
            _arg1.readBits(2, false);
            var _local3:int = _arg1.readBits(2, false);
            var _local4:int = _arg1.readBits(1, false);
            _arg1.readBits(11, false);
            if (_local3 == 2){
                _arg1.readWord(2, false);
            };
            if (_local4 == 0){
                Allocator.alloc(RGBColor).read(_arg1, _arg2);
                Allocator.alloc(RGBColor).read(_arg1, _arg2);
            };
            if (_local4 == 1){
                _local5 = (((_arg2.getDefineShape() is DefineMorphShape)) || ((_arg2.getDefineShape() is DefineMorphShape2)));
                switch (_arg1.scanWord(1, false)){
                    case FillStyle.Solid:
                        if (_local5){
                            Allocator.alloc(MorphSolidFill).read(_arg1, _arg2);
                        } else {
                            Allocator.alloc(SolidFill).read(_arg1, _arg2);
                        };
                        break;
                    case FillStyle.Linear:
                        if (_local5){
                            Allocator.alloc(MorphGradientFill).read(_arg1, _arg2);
                        } else {
                            Allocator.alloc(GradientFill).read(_arg1, _arg2);
                        };
                        break;
                    case FillStyle.Radial:
                        if (_local5){
                            Allocator.alloc(MorphGradientFill).read(_arg1, _arg2);
                        } else {
                            Allocator.alloc(GradientFill).read(_arg1, _arg2);
                        };
                        break;
                    case FillStyle.FocalRadial:
                        Allocator.alloc(FocalGradientFill).read(_arg1, _arg2);
                        break;
                    case FillStyle.Tiled:
                        if (_local5){
                            Allocator.alloc(MorphBitmapFill).read(_arg1, _arg2);
                        } else {
                            Allocator.alloc(BitmapFill).read(_arg1, _arg2);
                        };
                        break;
                    case FillStyle.Clipped:
                        if (_local5){
                            Allocator.alloc(MorphBitmapFill).read(_arg1, _arg2);
                        } else {
                            Allocator.alloc(BitmapFill).read(_arg1, _arg2);
                        };
                        break;
                    case FillStyle.UnsmoothedTiled:
                        if (_local5){
                            Allocator.alloc(MorphBitmapFill).read(_arg1, _arg2);
                        } else {
                            Allocator.alloc(BitmapFill).read(_arg1, _arg2);
                        };
                        break;
                    case FillStyle.UnsmoothedClipped:
                        if (_local5){
                            Allocator.alloc(MorphBitmapFill).read(_arg1, _arg2);
                        } else {
                            Allocator.alloc(BitmapFill).read(_arg1, _arg2);
                        };
                        break;
                };
            };
        }

    }
}
