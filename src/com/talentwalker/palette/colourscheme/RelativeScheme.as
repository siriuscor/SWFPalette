//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colourscheme {
    import flash.utils.*;
    import com.talentwalker.palette.colouriser.*;
    import com.talentwalker.palette.colourscheme.config.*;

    public class RelativeScheme implements ColourScheme {

        private var config:MonsterColourConfig;
        private var colourKey:Dictionary;
        private var colourOffset:Dictionary;

        public function RelativeScheme(){
            colourKey = new Dictionary(false);
            colourOffset = new Dictionary(false);
        }
        public function getReplacementColor(_arg1:String):RGBColor{
            var _local2:RGBColor = RGBColor.fromSerialized(_arg1);
            if (!colourKey[_local2.toString()]){
                return (_local2);
            };
            var _local3:String = colourKey[_local2.toString()];
            var _local4:HSVColor = colourOffset[_local2.toString()];
            var _local5:RGBColor = getHSVTotal(config.getBaseColour(_local3), _local4).toRGB();
            return (_local5);
        }
        public function setConfig(_arg1:MonsterColourConfig):void{
            this.config = _arg1;
        }
        public function addMapping(_arg1:String, _arg2:RGBColor, _arg3:Array):void{
            var _local4:uint = _arg3.length;
            var _local5:HSVColor = _arg2.toHSV();
            var _local6:uint;
            while (_local6 < _local4) {
                colourOffset[_arg3[_local6].toString()] = getHSVDifference(_local5, RGBColor.fromSerialized(_arg3[_local6]).toHSV());
                colourKey[_arg3[_local6].toString()] = _arg1;
                _local6++;
            };
            colourKey[_arg2.toString()] = _arg1;
            colourOffset[_arg2.toString()] = HSVColor.fromComponents(0, 0, 0, 0xFF);
        }
        private function getHSVTotal(_arg1:HSVColor, _arg2:HSVColor):HSVColor{
            var _local3:int = (_arg1.getHue() + _arg2.getHue());
            if (_local3 < 0){
                _local3 = (_local3 + 100);
            };
            _local3 = (_local3 % 100);
            var _local4:int = Math.min(Math.max((_arg1.getSaturation() + _arg2.getSaturation()), 0), 100);
            var _local5:int = Math.min(Math.max((_arg1.getValue() + _arg2.getValue()), 0), 100);
            return (HSVColor.fromComponents(_local3, _local4, _local5, _arg2.getAlpha()));
        }
        private function getHSVDifference(_arg1:HSVColor, _arg2:HSVColor):HSVColor{
            return (HSVColor.fromComponents(((_arg2.getHue() - _arg1.getHue()) % 100), (_arg2.getSaturation() - _arg1.getSaturation()), (_arg2.getValue() - _arg1.getValue()), _arg2.getAlpha()));
        }

    }
}//package com.mindcandy.utils.colourscheme 
