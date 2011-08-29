//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser {
//    import org.spicefactory.lib.logging.*;
    import com.talentwalker.palette.logging.*;

    public class HSVColor {

        private static var log:ILogger = com.talentwalker.palette.logging.LogUtil.getLogger();

        private var value:int;
        private var saturation:int;
        private var hue:int;
        private var alpha:int;

        public static function fromSerialized(_arg1:String):HSVColor{
            var _local2:Array = _arg1.split(",");
            if (_local2.length != 4){
                log.warn("Invalid serialized colour");
                return (null);
            };
            var _local3:HSVColor = new (HSVColor)();
            _local3.setHue(_local2[0]);
            _local3.setSaturation(_local2[1]);
            _local3.setValue(_local2[2]);
            _local3.setAlpha(((_local2[3] == "")) ? -1 : _local2[3]);
            return (_local3);
        }
        public static function fromComponents(_arg1:int=0, _arg2:int=0, _arg3:int=0, _arg4:int=-1):HSVColor{
            var _local5:HSVColor = new (HSVColor)();
            _local5.setHue(_arg1);
            _local5.setSaturation(_arg2);
            _local5.setValue(_arg3);
            _local5.setAlpha(_arg4);
            return (_local5);
        }

        public function setAlpha(_arg1:int):void{
            this.alpha = _arg1;
        }
        public function getSaturation():int{
            return (saturation);
        }
        public function getHue():int{
            return (hue);
        }
        public function toString():String{
            return (((((((hue + ",") + saturation) + ",") + value) + ",") + alpha));
        }
        public function setValue(_arg1:int):void{
            this.value = _arg1;
        }
        public function setSaturation(_arg1:int):void{
            this.saturation = _arg1;
        }
        public function setHue(_arg1:int):void{
            this.hue = _arg1;
        }
        public function getAlpha():int{
            return (alpha);
        }
        public function toRGB():RGBColor{
            var _local1:Number;
            var _local2:Number;
            var _local3:Number;
            var _local4:RGBColor = new RGBColor();
            var _local5:Number = (hue / 100);
            var _local6:Number = (saturation / 100);
            var _local7:Number = (value / 100);
            var _local8:Number = Math.floor((_local5 * 6));
            var _local9:Number = ((_local5 * 6) - _local8);
            var _local10:Number = (_local7 * (1 - _local6));
            var _local11:Number = (_local7 * (1 - (_local9 * _local6)));
            var _local12:Number = (_local7 * (1 - ((1 - _local9) * _local6)));
            switch (_local8){
                case 0:
                    _local1 = _local7;
                    _local2 = _local12;
                    _local3 = _local10;
                    break;
                case 1:
                    _local1 = _local11;
                    _local2 = _local7;
                    _local3 = _local10;
                    break;
                case 2:
                    _local1 = _local10;
                    _local2 = _local7;
                    _local3 = _local12;
                    break;
                case 3:
                    _local1 = _local10;
                    _local2 = _local11;
                    _local3 = _local7;
                    break;
                case 4:
                    _local1 = _local12;
                    _local2 = _local10;
                    _local3 = _local7;
                    break;
                case 5:
                    _local1 = _local7;
                    _local2 = _local10;
                    _local3 = _local11;
                    break;
            };
            _local4.setRed((_local1 * 0xFF));
            _local4.setGreen((_local2 * 0xFF));
            _local4.setBlue((_local3 * 0xFF));
            _local4.setAlpha(alpha);
            return (_local4);
        }
        public function getValue():int{
            return (value);
        }

    }
}
