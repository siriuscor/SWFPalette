//Created by Action Script Viewer - http://www.buraks.com/asv
package org.spicefactory.lib.logging.impl {
    import org.spicefactory.lib.logging.*;
    import org.spicefactory.lib.errors.*;

    public class DefaultLogFactory implements LogFactory {

        private static var _logger:ILogger;

        private var rootLogLevel:LogLevel;
        private var loggers:Object;
        private var appenders:Array;
        private var logLevels:Object;

        public function DefaultLogFactory(){
            appenders = new Array();
            logLevels = new Object();
            loggers = new Object();
            rootLogLevel = LogLevel.TRACE;
        }
        public function addLogLevel(_arg1:Object, _arg2:LogLevel):void{
            var _local3:String = LogUtil.getLogName(_arg1);
            if (logger.isInfoEnabled()){
                logger.info(((("Add LogLevel - name = " + _local3) + " - level = ") + _arg2));
            };
            logLevels[_local3] = _arg2;
        }
        public function setRootLogLevel(_arg1:LogLevel):void{
            if (logger.isInfoEnabled()){
                logger.info(("Set rootLogLevel = " + _arg1));
            };
            rootLogLevel = _arg1;
        }
        private function createLogger(_arg1:String):ILogger{
            var _local4:Appender;
            var _local2:LogLevel = findLevel(_arg1);
            var _local3:ILogger = new DefaultLogger(_arg1, _local2);
            loggers[_arg1] = _local3;
            for each (_local4 in appenders) {
                _local4.registerLogger(_local3);
            };
            return (_local3);
        }
        public function addAppender(_arg1:Appender):void{
            var _local2:ILogger;
            appenders.push(_arg1);
            for each (_local2 in loggers) {
                _arg1.registerLogger(_local2);
            };
        }
        protected function get logger():ILogger{
            if (_logger == null){
                _logger = getLogger("org.spicefactory.lib.logging.impl.DefaultLogFactory");
            };
            return (_logger);
        }
        private function findLevel(_arg1:String):LogLevel{
            if (logLevels[_arg1] != undefined){
                return (LogLevel(logLevels[_arg1]));
            };
            var _local2:String = getParentNameSpace(_arg1);
            if (_local2 != null){
                return (findLevel(_local2));
            };
            if (rootLogLevel != null){
                return (rootLogLevel);
            };
            throw (new IllegalArgumentError(("No configuration found for Logger - name = " + _arg1)));
        }
        public function getLogger(_arg1:Object):ILogger{
            var _local2:String = LogUtil.getLogName(_arg1);
            if (loggers[_local2] != undefined){
                return (ILogger(loggers[_local2]));
            };
            return (createLogger(_local2));
        }
        public function refresh():void{
            var _local1:ILogger;
            for each (_local1 in loggers) {
                _local1.level = findLevel(_local1.name);
            };
        }
        private function getParentNameSpace(_arg1:String):String{
            var _local2:int = _arg1.lastIndexOf("::");
            if (_local2 == -1){
                _local2 = _arg1.lastIndexOf(".");
            };
            if (_local2 == -1){
                return (null);
            };
            return (_arg1.substring(0, _local2));
        }

    }
}//package org.spicefactory.lib.logging.impl 
