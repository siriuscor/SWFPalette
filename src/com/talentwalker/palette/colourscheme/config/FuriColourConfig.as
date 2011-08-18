//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colourscheme.config {

    public class FuriColourConfig extends MonsterColourConfig {

        private const EYES:String = "Eyes";
        private const FUR:String = "Fur";
        private const FEET:String = "Feet";

        public function FuriColourConfig(_arg1:Array){
            super(_arg1);
        }
        override public function getLabels():Array{
            return ([FUR, EYES, FEET]);
        }

    }
}//package com.mindcandy.utils.colourscheme.config 
