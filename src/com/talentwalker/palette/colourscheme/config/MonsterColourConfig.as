//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colourscheme.config {
    import flash.utils.*;
    import com.talentwalker.palette.colouriser.*;
    import org.spicefactory.lib.logging.*;
    import com.talentwalker.palette.logging.*;

    public class MonsterColourConfig {

        private static var log:ILogger = LogUtil.getLogger();

        private var baseColours:Dictionary;

        public function MonsterColourConfig(_arg1:Array){
            baseColours = new Dictionary(false);
            var _local2:Array = getLabels();
            var _local3:int;
            while (_local3 < _arg1.length) {
                setBaseColour(_local2[_local3], _arg1[_local3]);
                _local3++;
            };
        }
        public function getBaseColour(_arg1:String):HSVColor{
            return ((baseColours[_arg1] as HSVColor));
        }
        public function getLabels():Array{
            return ([]);
        }
        public function toString():String{
            var _local2:String;
            var _local1:Array = [];
            for (_local2 in baseColours) {
                _local1.push(((_local2 + ":") + baseColours[_local2]));
            };
            return (_local1.join(","));
        }
        public function setBaseColour(_arg1:String, _arg2):void{
            if ((_arg2 is HSVColor)){
                baseColours[_arg1] = _arg2;
            } else {
                if ((_arg2 is int)){
                    baseColours[_arg1] = RGBColor.fromInt(uint(("0x" + _arg2.toString(16)))).toHSV();
                } else {
                    if ((_arg2 is String)){
                        baseColours[_arg1] = RGBColor.fromInt(uint((("0x" + _arg2) as String))).toHSV();
                    } else {
                        log.error(("Invalid colour passed to setBaseColour. Must be HSVColor or int. Is " + typeof(_arg2)));
                    };
                };
            };
        }

    }
}//package com.mindcandy.utils.colourscheme.config 
