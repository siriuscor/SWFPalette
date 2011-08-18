//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colourscheme.config {

    public class LuvliColourConfig extends MonsterColourConfig {

        private const EYES:String = "Eyes";
        private const STAR:String = "Star";
        private const BODY:String = "Body";

        public function LuvliColourConfig(_arg1:Array){
            super(_arg1);
        }
        override public function getLabels():Array{
            return ([BODY, STAR, EYES]);
        }

    }
}//package com.mindcandy.utils.colourscheme.config 
