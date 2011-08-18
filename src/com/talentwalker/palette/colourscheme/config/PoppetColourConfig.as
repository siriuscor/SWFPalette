//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colourscheme.config {

    public class PoppetColourConfig extends MonsterColourConfig {

        private const BOOTS:String = "Boots";
        private const EYES:String = "Eyes";
        private const BODY:String = "Body";

        public function PoppetColourConfig(_arg1:Array){
            super(_arg1);
        }
        override public function getLabels():Array{
            return ([BODY, EYES, BOOTS]);
        }

    }
}//package com.mindcandy.utils.colourscheme.config 
