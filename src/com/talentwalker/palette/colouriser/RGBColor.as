//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser {
    import com.talentwalker.palette.logging.*;
    import com.talentwalker.palette.alloctaor.*;
    
    import com.talentwalker.palette.BitArray;

    public class RGBColor implements Resettable {

        private static var log:ILogger = com.talentwalker.palette.logging.LogUtil.getLogger();
        public static var WHITE:RGBColor = RGBColor.fromComponents(0xFF, 0xFF, 0xFF, -1);
        public static var BLACK:RGBColor = RGBColor.fromComponents(0, 0, 0, -1);

        private var green:int;
        private var red:int;
        private var state:ParseState;
        private var blue:int;
        private var alpha:int;

        public static function fromComponents(_arg1:int=0, _arg2:int=0, _arg3:int=0, _arg4:int=-1):RGBColor{
            var _local5:RGBColor = new RGBColor();
            _local5.setRed(_arg1);
            _local5.setGreen(_arg2);
            _local5.setBlue(_arg3);
            _local5.setAlpha(_arg4);
            return (_local5);
        }
        public static function fromInt(_arg1:uint):RGBColor{
            var _local2:RGBColor = new (RGBColor)();
            _local2.setBlue((_arg1 & 0xFF));
            _local2.setGreen(((_arg1 & 0xFF00) >> 8));
            _local2.setRed(((_arg1 & 0xFF0000) >> 16));
            return (_local2);
        }
        public static function fromSerialized(_arg1:String):RGBColor{
            var _local2:Array = _arg1.split(",");
            if (_local2.length != 4){
                log.warn("Invalid serialized colour");
                return (null);
            };
            var _local3:RGBColor = new (RGBColor)();
            _local3.setRed(_local2[0]);
            _local3.setGreen(_local2[1]);
            _local3.setBlue(_local2[2]);
            _local3.setAlpha(((_local2[3] == "")) ? -1 : _local2[3]);
            return (_local3);
        }

        public function setGreen(_arg1:int):void{
            this.green = _arg1;
        }
        private function getGreen():int{
            return (this.green);
        }
        public function setRed(_arg1:int):void{
            this.red = _arg1;
        }
        private function getBlue():int{
            return (this.blue);
        }
        public function toHSV():HSVColor{
            var _local7:Number;
            var _local8:Number;
            var _local9:Number;
            var _local1:HSVColor = new HSVColor();
            var _local2:Number = red;
            var _local3:Number = green;
            var _local4:Number = blue;
            _local2 = (_local2 / 0xFF);
            _local3 = (_local3 / 0xFF);
            _local4 = (_local4 / 0xFF);
            var _local5:Number = Math.max(_local2, _local3, _local4);
            var _local6:Number = Math.min(_local2, _local3, _local4);
            _local9 = _local5;
            _local8 = _local9;
            _local7 = _local8;
            var _local10:Number = (_local5 - _local6);
            _local8 = ((_local5 == 0)) ? 0 : (_local10 / _local5);
            if (_local5 == _local6){
                _local7 = 0;
            } else {
                switch (_local5){
                    case _local2:
                        _local7 = (((_local3 - _local4) / _local10) + ((_local3 < _local4)) ? 6 : 0);
                        break;
                    case _local3:
                        _local7 = (((_local4 - _local2) / _local10) + 2);
                        break;
                    case _local4:
                        _local7 = (((_local2 - _local3) / _local10) + 4);
                        break;
                };
                _local7 = (_local7 / 6);
            };
            _local1.setHue((_local7 * 100));
            _local1.setSaturation((_local8 * 100));
            _local1.setValue((_local9 * 100));
            _local1.setAlpha(alpha);
            return (_local1);
        }
        private function getRed():int{
            return (this.red);
        }
        public function setAlpha(_arg1:int):void{
            this.alpha = _arg1;
        }
        public function read(_arg1:BitArray=null, parseState:ParseState=null):void{
            var _local3:int;
            var _local4:int;
            var _local5:RGBColor;
            var _local6:int;
            this.state = parseState;
            if (_arg1){
                if (parseState.getBuildColouriserIndex()){
                    parseState.getColouriserIndex().addIndex(_arg1.getPointer(), parseState.getAlpha());
                };
                _local3 = _arg1.getPointer();
                
                this.red = _arg1.readWord(1, false);
                this.green = _arg1.readWord(1, false);
                this.blue = _arg1.readWord(1, false);
                if (parseState.getAlpha()){
                    this.alpha = _arg1.readWord(1, false);
                } else {
                    this.alpha = -1;
                };
//                trace(_local3,this.red,this.green,this.blue,this.alpha,this.toInt());
                parseState.addPalette(this.toInt(), _local3);
                _local4 = _arg1.getPointer();
//                if (red == 196 && green == 57 && blue==22)
//                    trace(_local3,this.red,this.green,this.blue,this.alpha,this.toUint());
//                _local5 = RGBColor.fromComponents(255,0,0,255);//_arg2.getColorScheme().getReplacementColor(this.toString());
                if (_local5 != null){
                    _arg1.setPointer(_local3);
                    _arg1.writeWord(_local5.getRed(), 1);
                    _arg1.writeWord(_local5.getGreen(), 1);
                    _arg1.writeWord(_local5.getBlue(), 1);
                    if (parseState.getAlpha()){
                        _local6 = _local5.getAlpha();
                        if (_local6 == -1){
                            _local6 = 0xFF;
                        };
                        _arg1.writeWord(_local6, 1);
                    };
                    _arg1.setPointer(_local4);
                };
                _arg1.setPointer(_local3);
                _arg1.setPointer(_local4);
            };
        }
        public function setBlue(_arg1:int):void{
            this.blue = _arg1;
        }
        public function getAlpha():int{
            return (this.alpha);
        }
        public function toString():String{
            return (((((((red + ",") + green) + ",") + blue) + ",") + alpha));
        }
        public function toInt():uint{
            var _local1:uint;
            _local1 = (_local1 + (red << 16));
            _local1 = (_local1 + (green << 8));
            _local1 = (_local1 + blue);
            return (_local1);
        }
        public static function fromUint(color:uint):RGBColor{
            var _local2:RGBColor = new (RGBColor)();
            _local2.setAlpha(color & 0xFF);
            _local2.setBlue((color & 0xFF) >> 8);
            _local2.setGreen(((color & 0xFF00) >> 16));
            _local2.setRed(((color & 0xFF0000) >> 24));
            return (_local2);
        }
        public function toUint():uint{
            var _local1:uint;
            _local1 = (_local1 + (red << 24));
            _local1 = (_local1 + (green << 16));
            _local1 = (_local1 + (blue << 8));
            _local1 = (_local1 + alpha);
            return (_local1);
        }
        public function equals(_arg1:RGBColor):Boolean{
            if (((((!((_arg1.getRed() == this.red))) || (!((_arg1.getGreen() == this.green))))) || (!((_arg1.getBlue() == this.blue))))){
                return (false);
            };
            if (((((!((this.alpha == -1))) && (!((_arg1.getAlpha() == -1))))) && (!((_arg1.getAlpha() == this.alpha))))){
                return (false);
            };
            return (true);
        }

    }
}
