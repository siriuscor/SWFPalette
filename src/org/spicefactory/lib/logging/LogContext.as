//Created by Action Script Viewer - http://www.buraks.com/asv
package org.spicefactory.lib.logging {
    import org.spicefactory.lib.logging.impl.*;

    public class LogContext {

        private static var loggers:Object = new Object();
        private static var _factory:LogFactory;

        private static function refreshDelegates():void{
            var _local1:DelegateLogger;
            for each (_local1 in loggers) {
                _local1.delegate = _factory.getLogger(_local1.name);
            };
        }
        public static function set factory(_arg1:LogFactory):void{
            _factory = _arg1;
            refreshDelegates();
        }
        public static function getLogger(_arg1:Object):ILogger{
            var _local2:String = LogUtil.getLogName(_arg1);
            if (loggers[_local2] != null){
                return (loggers[_local2]);
            };
            var _local3:ILogger = factory.getLogger(_local2);
            var _local4:DelegateLogger = new DelegateLogger(_local3);
            loggers[_local2] = _local4;
            return (_local4);
        }
        public static function get factory():LogFactory{
            if (_factory == null){
                createDefaultFactory();
            };
            return (_factory);
        }
        private static function createDefaultFactory():void{
            _factory = new DefaultLogFactory();
            _factory.addAppender(new TraceAppender());
        }

    }
}//package org.spicefactory.lib.logging 
