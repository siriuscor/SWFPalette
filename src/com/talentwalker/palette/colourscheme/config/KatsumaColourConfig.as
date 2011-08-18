//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colourscheme.config {

    public class KatsumaColourConfig extends MonsterColourConfig {

        private const EYES:String = "Eyes";
        private const STRIPES:String = "Stripes";
        private const BODY:String = "Body";

        public function KatsumaColourConfig(_arg1:Array){
            super(_arg1);
        }
        override public function getLabels():Array{
            return ([BODY, STRIPES, EYES]);
        }

    }
}//package com.mindcandy.utils.colourscheme.config 
