//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colouriser {
    import com.talentwalker.palette.alloctaor.*;
    import com.talentwalker.palette.BitArray;

    public class Bounds implements Resettable {

        public function read(bytes:BitArray=null, _arg2:ParseState=null):void{
            bytes.alignToByte();
            var fieldLength:int = bytes.readBits(5, false);
            bytes.readBits((fieldLength * 4), true);
            bytes.alignToByte();
        }
    }
}//package com.mindcandy.utils.colouriser 
