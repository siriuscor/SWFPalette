//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.colourscheme.config {
    import org.spicefactory.lib.logging.*;
    import com.talentwalker.palette.logging.*;

    public class MonsterColourConfigFactory {

        private static const FURI:String = "furi";
        private static const ZOMMER:String = "zommer";
        private static const LUVLI:String = "luvli";
        private static const POPPET:String = "poppet";
        private static const KATSUMA:String = "katsuma";
        private static const DIAVLO:String = "diavlo";

        private static var log:ILogger = LogUtil.getLogger();

        public static function createMonsterColourConfig(_arg1:String, _arg2:Array):MonsterColourConfig{
            log.info(((("Create colour config for " + _arg1) + " with ") + _arg2.join(",")));
            switch (_arg1){
                case DIAVLO:
                    return (new DiavloColourConfig(_arg2));
                case FURI:
                    return (new FuriColourConfig(_arg2));
                case KATSUMA:
                    return (new KatsumaColourConfig(_arg2));
                case LUVLI:
                    return (new LuvliColourConfig(_arg2));
                case POPPET:
                    return (new PoppetColourConfig(_arg2));
                case ZOMMER:
                    return (new ZommerColourConfig(_arg2));
            };
            return (null);
        }

    }
}//package com.mindcandy.utils.colourscheme.config 
