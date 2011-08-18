//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colourscheme.monster {
    import com.talentwalker.palette.colourscheme.*;

    public class KatsumaScheme extends MonsterScheme {

        private var relativeScheme:Class;
        private var absoluteScheme:Class;

        public function KatsumaScheme(){
            absoluteScheme = KatsumaScheme_absoluteScheme;
            relativeScheme = KatsumaScheme_relativeScheme;
            super(absoluteScheme, relativeScheme);
        }
    }
}//package com.mindcandy.utils.colourscheme.monster 
