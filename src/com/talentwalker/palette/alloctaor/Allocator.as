//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.alloctaor {
    import com.talentwalker.palette.logging.*;
    
    import flash.utils.*;
    
    public class Allocator {

        private static var usedCount:Dictionary = new Dictionary();
        private static var log :ILogger = com.talentwalker.palette.logging.LogUtil.getLogger();
        private static var classes:Dictionary = new Dictionary();
        public static var allocCount:uint = 0;

        public static function debug():void{
            var _local1:Object;
            for (_local1 in usedCount) {
                log.info(((("Object: " + _local1) + " was used allocated : ") + usedCount[_local1]));
            };
        }
        public static function alloc(_arg1:Class):Resettable{
            var _local2:Object = classes[_arg1];
            if (_local2){
                return ((_local2 as Resettable));
            };
            _local2 = Object(new (_arg1)());
            classes[_arg1] = _local2;
            return ((_local2 as Resettable));
        }

    }
}
