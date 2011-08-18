//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colourscheme.config {

    public class ZommerColourConfig extends MonsterColourConfig {

        private const HAIR:String = "Hair";
        private const BODY:String = "Body";
        private const SKIN:String = "Skin";

        public function ZommerColourConfig(_arg1:Array){
            super(_arg1);
        }
        override public function getLabels():Array{
            return ([SKIN, HAIR, BODY]);
        }

    }
}//package com.mindcandy.utils.colourscheme.config 
