//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser {
    import com.talentwalker.palette.alloctaor.*;
    import org.spicefactory.lib.logging.*;
    import com.talentwalker.palette.colouriser.defineobject.*;
    import com.talentwalker.palette.logging.*;
    import com.talentwalker.palette.colouriser.fillstyle.*;
    import com.talentwalker.palette.BitArray;

    public class FillStyleArray implements Resettable {

        private static var log:ILogger = com.talentwalker.palette.logging.LogUtil.getLogger();

        public function read(_arg1:BitArray=null, _arg2:ParseState=null):void{
            var _local3:Boolean = (((_arg2.getDefineShape() is DefineMorphShape)) || ((_arg2.getDefineShape() is DefineMorphShape2)));
            var _local4:int = _arg1.readWord(1, false);
            if (((_arg2.getExtendedArray()) && ((_local4 == 0xFF)))){
                _local4 = _arg1.readWord(2, false);
            };
            var _local5:int;
            while (_local5 < _local4) {
                switch (_arg1.scanWord(1, false)){
                    case FillStyle.Solid:
                        if (_local3){
                            Allocator.alloc(MorphSolidFill).read(_arg1, _arg2);
                        } else {
                            Allocator.alloc(SolidFill).read(_arg1, _arg2);
                        };
                        break;
                    case FillStyle.Linear:
                    case FillStyle.Radial:
                        if (_local3){
                            Allocator.alloc(MorphGradientFill).read(_arg1, _arg2);
                        } else {
                            Allocator.alloc(GradientFill).read(_arg1, _arg2);
                        };
                        break;
                    case FillStyle.FocalRadial:
                        if ((_arg2.getDefineShape() is DefineShape4)){
                            Allocator.alloc(FocalGradientFill).read(_arg1, _arg2);
                        } else {
                            if ((((_arg2.getDefineShape() is DefineMorphShape)) || ((_arg2.getDefineShape() is DefineMorphShape2)))){
                                Allocator.alloc(MorphFocalGradientFill).read(_arg1, _arg2);
                            } else {
                                log.error("Got FocalGradientFill in object that wasn't a DefineShape4!");
                            };
                        };
                        break;
                    case FillStyle.Tiled:
                    case FillStyle.Clipped:
                    case FillStyle.UnsmoothedTiled:
                    case FillStyle.UnsmoothedClipped:
                        if (_local3){
                            Allocator.alloc(MorphBitmapFill).read(_arg1, _arg2);
                        } else {
                            Allocator.alloc(BitmapFill).read(_arg1, _arg2);
                        };
                        break;
                };
                _local5++;
            };
        }

    }
}//package com.mindcandy.utils.colouriser 
