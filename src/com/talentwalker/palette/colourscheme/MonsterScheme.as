//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colourscheme {
    import flash.utils.*;
    import com.talentwalker.palette.colouriser.*;

    public class MonsterScheme {

        private var absoluteMonsterTemplate:AbsoluteScheme;
        private var absoluteMonsterSchemes:Array;
        private var relativeScheme:RelativeScheme;
        private var schemeString:String;

        public function MonsterScheme(_arg1:Class, _arg2:Class=null){
            var _local5:XML;
            var _local6:ByteArray;
            super();
            var _local3:ByteArray = (new (_arg1)() as ByteArray);
            var _local4:XML = XML(_local3.toString());
            this.absoluteMonsterTemplate = generateAbsoluteScheme(_local4.template.map);
            this.absoluteMonsterSchemes = new Array();
            for each (_local5 in _local4.scheme) {
                this.absoluteMonsterSchemes[_local5.@id] = generateAbsoluteScheme(_local5.children());
            };
            if (_arg2 != null){
                _local6 = (new (_arg2)() as ByteArray);
                this.schemeString = _local6.toString();
                this.relativeScheme = generateRelativeScheme(schemeString);
            };
        }
        private function generateRelativeScheme(_arg1:String):RelativeScheme{
            var _local6:Array;
            var _local7:String;
            var _local8:String;
            var _local9:Array;
            var _local2:RelativeScheme = new RelativeScheme();
            if ((((_arg1.indexOf("\n") == -1)) && (!((_arg1.indexOf("\r") == -1))))){
                while (_arg1.indexOf("\r") != -1) {
                    _arg1 = _arg1.replace("\r", "\n");
                };
            };
            var _local3:Array = _arg1.split("\n");
            var _local4:uint = _local3.length;
            var _local5:uint;
            while (_local5 < _local4) {
                _local6 = _local3[_local5].split("|");
                _local7 = _local6[0];
                _local8 = _local6[1];
                _local9 = _local6[2].split(";");
                _local2.addMapping(_local7, RGBColor.fromSerialized(_local8), _local9);
                _local5++;
            };
            return (_local2);
        }
        public function getRelativeScheme():RelativeScheme{
            return (relativeScheme);
        }
        public function generateCompositeScheme(_arg1:int, _arg2:int):AbsoluteScheme{
            var _local5:String;
            var _local6:RGBColor;
            var _local3:Array = absoluteMonsterTemplate.getMapping();
            var _local4:AbsoluteScheme = new AbsoluteScheme();
            for (_local5 in _local3) {
                _local6 = _local3[_local5];
                if (_local6.equals(RGBColor.BLACK)){
                    _local4.getMapping()[_local5] = absoluteMonsterSchemes[_arg1].getReplacementColor(_local5);
                } else {
                    if (_local6.equals(RGBColor.WHITE)){
                        _local4.getMapping()[_local5] = absoluteMonsterSchemes[_arg2].getReplacementColor(_local5);
                    } else {
                        _local4.getMapping()[_local5] = _local6;
                    };
                };
            };
            return (_local4);
        }
        private function generateAbsoluteScheme(_arg1:XMLList):AbsoluteScheme{
            var _local3:XML;
            var _local4:String;
            var _local5:String;
            var _local2:AbsoluteScheme = new AbsoluteScheme();
            for each (_local3 in _arg1) {
                _local4 = _local3.@from;
                _local5 = _local3.@to;
                _local2.addMapping(RGBColor.fromSerialized(_local4).toString(), RGBColor.fromSerialized(_local5));
            };
            return (_local2);
        }
        public function getSchemeString():String{
            return (schemeString);
        }
        public function setSchemeString(_arg1:String):void{
            this.schemeString = _arg1;
            this.relativeScheme = generateRelativeScheme(_arg1);
        }

    }
}//package com.mindcandy.utils.colourscheme 
