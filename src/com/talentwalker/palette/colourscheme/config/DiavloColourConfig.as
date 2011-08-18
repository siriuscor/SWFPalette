//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colourscheme.config {

    public class DiavloColourConfig extends MonsterColourConfig {

        private const BODY:String = "Body";
        private const EYES:String = "Eyes";
        private const FACE:String = "Face";

        public function DiavloColourConfig(_arg1:Array){
            super(_arg1);
        }
        override public function getLabels():Array{
            return ([BODY, FACE, EYES]);
        }

    }
}//package com.mindcandy.utils.colourscheme.config 
