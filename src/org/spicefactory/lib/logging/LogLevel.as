//Created by Action Script Viewer - http://www.buraks.com/asv
package org.spicefactory.lib.logging {

    public class LogLevel {

        public static const FATAL:LogLevel = new LogLevel(6, "FATAL");
;
        public static const TRACE:LogLevel = new LogLevel(1, "TRACE");
;
        public static const WARN:LogLevel = new LogLevel(4, "WARN");
;
        public static const INFO:LogLevel = new LogLevel(3, "INFO");
;
        public static const OFF:LogLevel = new LogLevel(7, "OFF");
;
        public static const DEBUG:LogLevel = new LogLevel(2, "DEBUG");
;
        public static const ERROR:LogLevel = new LogLevel(5, "ERROR");
;

        private var _string:String;
        private var _value:uint;

        public function LogLevel(_arg1:uint, _arg2:String){
            _value = _arg1;
            _string = _arg2;
        }
        public function toValue():uint{
            return (_value);
        }
        public function toString():String{
            return (_string);
        }

    }
}//package org.spicefactory.lib.logging 
