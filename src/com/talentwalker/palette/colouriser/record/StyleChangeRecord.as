//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser.record {
    import com.talentwalker.palette.colouriser.*;
    import com.talentwalker.palette.alloctaor.*;
    import org.spicefactory.lib.logging.*;
    import com.talentwalker.palette.colouriser.defineobject.*;
    import com.talentwalker.palette.logging.*;
    import com.talentwalker.palette.colouriser.fillstyle.*;
    import com.talentwalker.palette.colouriser.line.*;
    import com.talentwalker.palette.BitArray;

    public class StyleChangeRecord implements Resettable {

        private static var log:ILogger = com.talentwalker.palette.logging.LogUtil.getLogger();

        public static function readQuick(_arg1:BitArray=null, _arg2:ParseState=null):void{
            var _local10:int;
            var _local11:int;
            var _local12:int;
            var _local13:int;
            var _local14:int;
            var _local3:int = _arg2.getNumFillBits();
            var _local4:int = _arg2.getNumLineBits();
            if (_arg1.readBits(1, false) != 0){
                log.error("StyleChangeRecord edge bit should be 0");
            };
            var _local5 = !((_arg1.readBits(1, false) == 0));
            var _local6 = !((_arg1.readBits(1, false) == 0));
            var _local7 = !((_arg1.readBits(1, false) == 0));
            var _local8 = !((_arg1.readBits(1, false) == 0));
            var _local9 = !((_arg1.readBits(1, false) == 0));
            if (_local9){
                _local10 = _arg1.readBits(5, false);
                _arg1.readBits(_local10, true);
                _arg1.readBits(_local10, true);
            };
            if (_local8){
                _arg1.readBits(_local3, false);
            };
            if (_local7){
                _arg1.readBits(_local3, false);
            };
            if (_local6){
                _arg1.readBits(_local4, false);
            };
            if (_local5){
                _arg1.alignToByte();
                _local11 = _arg1.readWord(1, false);
                if (((_arg2.getExtendedArray()) && ((_local11 == 0xFF)))){
                    _local11 = _arg1.readWord(2, false);
                };
                _local12 = 0;
                while (_local12 < _local11) {
                    switch (_arg1.scanWord(1, false)){
                        case FillStyle.Solid:
                            Allocator.alloc(SolidFill).read(_arg1, _arg2);
                            break;
                        case FillStyle.Linear:
                        case FillStyle.Radial:
                            Allocator.alloc(GradientFill).read(_arg1, _arg2);
                            break;
                        case FillStyle.Tiled:
                        case FillStyle.Clipped:
                        case FillStyle.UnsmoothedTiled:
                        case FillStyle.UnsmoothedClipped:
                            Allocator.alloc(BitmapFill).read(_arg1, _arg2);
                            break;
                    };
                    _local12++;
                };
                _local13 = _arg1.readWord(1, false);
                if (((_arg2.getExtendedArray()) && ((_local13 == 0xFF)))){
                    _local13 = _arg1.readWord(2, false);
                };
                _local14 = 0;
                while (_local14 < _local13) {
                    if ((_arg2.getDefineShape() is DefineShape4)){
                        Allocator.alloc(SolidLine2).read(_arg1, _arg2);
                    } else {
                        Allocator.alloc(SolidLine).read(_arg1, _arg2);
                    };
                    _local14++;
                };
                _arg2.setNumFillBits(_arg1.readBits(4, false));
                _arg2.setNumLineBits(_arg1.readBits(4, false));
            };
        }

        public function read(_arg1:BitArray=null, _arg2:ParseState=null):void{
            var _local10:int;
            var _local11:int;
            var _local12:int;
            var _local13:int;
            var _local14:int;
            var _local3:int = _arg2.getNumFillBits();
            var _local4:int = _arg2.getNumLineBits();
            if (_arg1.readBits(1, false) != 0){
                log.error("e StyleChangeRecord edge bit should be 0");
            };
            var _local5 = !((_arg1.readBits(1, false) == 0));
            var _local6 = !((_arg1.readBits(1, false) == 0));
            var _local7 = !((_arg1.readBits(1, false) == 0));
            var _local8 = !((_arg1.readBits(1, false) == 0));
            var _local9 = !((_arg1.readBits(1, false) == 0));
            if (_local9){
                _local10 = _arg1.readBits(5, false);
                _arg1.readBits(_local10, true);
                _arg1.readBits(_local10, true);
            };
            if (_local8){
                _arg1.readBits(_local3, false);
            };
            if (_local7){
                _arg1.readBits(_local3, false);
            };
            if (_local6){
                _arg1.readBits(_local4, false);
            };
            if (_local5){
                _arg1.alignToByte();
                _local11 = _arg1.readWord(1, false);
                if (((_arg2.getExtendedArray()) && ((_local11 == 0xFF)))){
                    _local11 = _arg1.readWord(2, false);
                };
                _local12 = 0;
                while (_local12 < _local11) {
                    switch (_arg1.scanWord(1, false)){
                        case FillStyle.Solid:
                            Allocator.alloc(SolidFill).read(_arg1, _arg2);
                            break;
                        case FillStyle.Linear:
                        case FillStyle.Radial:
                            Allocator.alloc(GradientFill).read(_arg1, _arg2);
                            break;
                        case FillStyle.Tiled:
                        case FillStyle.Clipped:
                        case FillStyle.UnsmoothedTiled:
                        case FillStyle.UnsmoothedClipped:
                            Allocator.alloc(BitmapFill).read(_arg1, _arg2);
                            break;
                    };
                    _local12++;
                };
                _local13 = _arg1.readWord(1, false);
                if (((_arg2.getExtendedArray()) && ((_local13 == 0xFF)))){
                    _local13 = _arg1.readWord(2, false);
                };
                _local14 = 0;
                while (_local14 < _local13) {
                    if ((_arg2.getDefineShape() is DefineShape4)){
                        Allocator.alloc(SolidLine2).read(_arg1, _arg2);
                    } else {
                        Allocator.alloc(SolidLine).read(_arg1, _arg2);
                    };
                    _local14++;
                };
                _arg2.setNumFillBits(_arg1.readBits(4, false));
                _arg2.setNumLineBits(_arg1.readBits(4, false));
            };
        }

    }
}//package com.mindcandy.utils.colouriser.record 
