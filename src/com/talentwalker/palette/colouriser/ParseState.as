//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser {
    import com.talentwalker.palette.colourscheme.*;

    public class ParseState {

        private var numFillBits:int;
        private var numLineBits:int;
        private var alpha:Boolean;
        private var extendedArray:Boolean;
        private var buildColouriserIndex:Boolean;
        private var defineShape:DefineObject;
        private var colorScheme:ColourScheme;
        private var colouriserIndex:ColouriserIndex;

        public var palette = {};
        public function addPalette(color:uint, pos:int):void {
            if (palette[color] == null) {
                palette[color] = [];
            }
            palette[color].push(pos);
        }
        
        public function hasColouriserIndex():Boolean{
            return (!((colouriserIndex == null)));
        }
        public function getNumLineBits():int{
            return (numLineBits);
        }
        public function setNumFillBits(_arg1:int):void{
            this.numFillBits = _arg1;
        }
        public function getBuildColouriserIndex():Boolean{
            return (buildColouriserIndex);
        }
        public function getNumFillBits():int{
            return (numFillBits);
        }
        public function setAlpha(_arg1:Boolean):void{
            this.alpha = _arg1;
        }
        public function setBuildColouriserIndex(_arg1:Boolean):void{
            this.buildColouriserIndex = _arg1;
        }
        public function setDefineShape(_arg1:DefineObject):void{
            this.defineShape = _arg1;
        }
        public function setExtendedArray(_arg1:Boolean):void{
            this.extendedArray = _arg1;
        }
        public function getExtendedArray():Boolean{
            return (extendedArray);
        }
        public function getDefineShape():DefineObject{
            return (defineShape);
        }
        public function getColorScheme():ColourScheme{
            return (colorScheme);
        }
        public function setColouriserIndex(_arg1:ColouriserIndex):void{
            this.colouriserIndex = _arg1;
        }
        public function setColorScheme(_arg1:ColourScheme):void{
            this.colorScheme = _arg1;
        }
        public function getAlpha():Boolean{
            return (alpha);
        }
        public function getColouriserIndex():ColouriserIndex{
            return (colouriserIndex);
        }
        public function setNumLineBits(_arg1:int):void{
            this.numLineBits = _arg1;
        }

    }
}//package com.mindcandy.utils.colouriser 
