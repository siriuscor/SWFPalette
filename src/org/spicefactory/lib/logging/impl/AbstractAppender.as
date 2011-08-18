//Created by Action Script Viewer - http://www.buraks.com/asv
package org.spicefactory.lib.logging.impl {
    import org.spicefactory.lib.logging.*;

    public class AbstractAppender implements Appender {

        private var _threshold:LogLevel;

        public function AbstractAppender(){
            _threshold = LogLevel.TRACE;
        }
        protected function isBelowThreshold(_arg1:LogLevel):Boolean{
            return ((_arg1.toValue() < _threshold.toValue()));
        }
        public function registerLogger(_arg1:ILogger):void{
            _arg1.addEventListener(LogEvent.LOG, handleLogEvent);
        }
        public function get threshold():LogLevel{
            return (_threshold);
        }
        public function set threshold(_arg1:LogLevel):void{
            _threshold = _arg1;
        }
        protected function handleLogEvent(_arg1:LogEvent):void{
        }

    }
}//package org.spicefactory.lib.logging.impl 
