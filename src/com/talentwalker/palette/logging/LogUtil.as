//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette.logging {
    import org.spicefactory.lib.logging.*;
    import org.spicefactory.lib.logging.impl.*;

    public class LogUtil {

        private static var _INSTANCE:LogUtil;

        private var controller:Object;

        public function LogUtil(_arg1=null):void{
            this.controller = _arg1;
//            this.useDefaultConfiguration();
        }
        public static function isDebugBuild():Boolean{
            return (false);
        }
        public static function getLogger():ILogger{
//            var _local1 = "com.moshimonsters";
//            return (LogContext.getLogger(_local1));
            return new DefaultLogger("test",null);
        }
        public static function init(_arg1:Object=null, _arg2:String=null):void{
            if (_INSTANCE == null){
                _INSTANCE = new LogUtil(_arg1);
            };
        }

//        public function useDefaultConfiguration():void{
//            var _local1:LogFactory = new DefaultLogFactory();
//            _local1.setRootLogLevel(LogLevel.FATAL);
//            var _local2:Appender = new TraceAppender();
//            _local2.threshold = LogLevel.DEBUG;
//            _local1.addAppender(_local2);
//            LogContext.factory = _local1;
//            if (this.controller != null){
//                var _local3 = this.controller;
//                _local3["handleReady"](null);
//            };
//        }

    }
}//package com.mindcandy.diablo.utils.logging 
