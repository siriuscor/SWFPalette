//Created by Action Script Viewer - http://www.buraks.com/asv
package org.spicefactory.lib.logging.impl {
    import flash.events.*;
    import org.spicefactory.lib.logging.*;

    public class DefaultLogger extends EventDispatcher implements ILogger {

        private var _level:LogLevel;
        private var _name:String;

        public function DefaultLogger(_arg1:String, _arg2:LogLevel){
            _name = _arg1;
            _level = _arg2;
        }
        public function isTraceEnabled():Boolean{
            return ((level.toValue() <= LogLevel.TRACE.toValue()));
        }
        public function set level(_arg1:LogLevel):void{
            _level = _arg1;
        }
        public function trace(_arg1:String, _arg2:Error=null):void{
            if (!isTraceEnabled()){
                return;
            };
            dispatch(LogLevel.TRACE, _arg1, _arg2);
        }
        public function isWarnEnabled():Boolean{
            return ((level.toValue() <= LogLevel.WARN.toValue()));
        }
        public function get name():String{
            return (_name);
        }
        public function get level():LogLevel{
            return (_level);
        }
        public function warn(_arg1:String, _arg2:Error=null):void{
            if (!isWarnEnabled()){
                return;
            };
            dispatch(LogLevel.WARN, _arg1, _arg2);
        }
        public function error(_arg1:String, _arg2:Error=null):void{
            if (!isErrorEnabled()){
                return;
            };
            dispatch(LogLevel.ERROR, _arg1, _arg2);
        }
        public function debug(_arg1:String, _arg2:Error=null):void{
            if (!isDebugEnabled()){
                return;
            };
            dispatch(LogLevel.DEBUG, _arg1, _arg2);
        }
        public function fatal(_arg1:String, _arg2:Error=null):void{
            if (!isFatalEnabled()){
                return;
            };
            dispatch(LogLevel.FATAL, _arg1, _arg2);
        }
        public function isErrorEnabled():Boolean{
            return ((level.toValue() <= LogLevel.ERROR.toValue()));
        }
        public function isFatalEnabled():Boolean{
            return ((level.toValue() <= LogLevel.FATAL.toValue()));
        }
        public function isInfoEnabled():Boolean{
            return ((level.toValue() <= LogLevel.INFO.toValue()));
        }
        public function info(_arg1:String, _arg2:Error=null):void{
            if (!isInfoEnabled()){
                return;
            };
            dispatch(LogLevel.INFO, _arg1, _arg2);
        }
        public function isDebugEnabled():Boolean{
            return ((level.toValue() <= LogLevel.DEBUG.toValue()));
        }
        private function dispatch(_arg1:LogLevel, _arg2:String, _arg3:Error):void{
            dispatchEvent(new LogEvent(_arg1, _arg2, _arg3));
        }

    }
}//package org.spicefactory.lib.logging.impl 
