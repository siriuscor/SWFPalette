//Created by Action Script Viewer - http://www.buraks.com/asv
package org.spicefactory.lib.logging {
    import flash.events.*;

    public class LogEvent extends Event {

        public static const LOG:String = "log";

        private var _level:LogLevel;
        private var _message:String;
        private var _error:Error;

        public function LogEvent(_arg1:LogLevel, _arg2:String, _arg3:Error=null){
            super(LOG);
            _level = _arg1;
            _message = _arg2;
            _error = _arg3;
        }
        public function get level():LogLevel{
            return (_level);
        }
        public function get message():String{
            return (_message);
        }
        public function get error():Error{
            return (_error);
        }

    }
}//package org.spicefactory.lib.logging 
