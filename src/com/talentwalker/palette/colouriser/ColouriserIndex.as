//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser {

    public class ColouriserIndex {

        private var bitPositions:Array;
        private var transparencyFlags:Array;

        public function ColouriserIndex(_arg1:Array=null, _arg2:Array=null){
            this.bitPositions = ((_arg1 == null)) ? [] : _arg1;
            this.transparencyFlags = ((_arg2 == null)) ? [] : _arg2;
        }
        public function addIndex(_arg1:int, _arg2:Boolean):void{
            bitPositions.push(_arg1);
            transparencyFlags.push(_arg2);
        }
        public function getBitPositions():Array{
            return (bitPositions);
        }
        public function setTransparencyFlags(_arg1:Array):void{
            this.transparencyFlags = _arg1;
        }
        public function setBitPositions(_arg1:Array):void{
            this.bitPositions = _arg1;
        }
        public function getTransparencyFlags():Array{
            return (transparencyFlags);
        }

    }
}//package com.mindcandy.utils.colouriser 
