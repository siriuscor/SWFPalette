//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colourscheme {
    import com.talentwalker.palette.colouriser.*;

    public class AbsoluteScheme implements ColourScheme {

        private var mapping:Array;

        public function AbsoluteScheme(){
            this.mapping = new Array();
        }
        public function getReplacementColor(_arg1:String):RGBColor{
            return ((this.mapping[_arg1] as RGBColor));
        }
        public function getMapping():Array{
            return (mapping);
        }
        public function addMapping(_arg1:String, _arg2:RGBColor):void{
            mapping[_arg1] = _arg2;
        }

    }
}//package com.mindcandy.utils.colourscheme 
