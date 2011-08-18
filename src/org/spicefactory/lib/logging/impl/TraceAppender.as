//Created by Action Script Viewer - http://www.buraks.com/asv
package org.spicefactory.lib.logging.impl {
    import org.spicefactory.lib.logging.*;

    public class TraceAppender extends AbstractAppender {

        private var needsLineFeed:Boolean;

        public function TraceAppender(){
            needsLineFeed = false;
        }
        override protected function handleLogEvent(_arg1:LogEvent):void{
            var _local3:String;
            var _local4:String;
            var _local5:int;
            var _local6:String;
            var _local7:String;
            if (isBelowThreshold(_arg1.level)){
                return;
            };
            var _local2:String = ILogger(_arg1.target).name;
            if ((((_arg1.level.toValue() <= LogLevel.INFO.toValue())) && ((_arg1.error == null)))){
                _local4 = ((_arg1.level)==LogLevel.DEBUG) ? "DEBUG: " : "INFO:  ";
                _local2 = _local2.replace("::", ".");
                _local5 = _local2.lastIndexOf(".");
                if (_local5 != -1){
                    _local2 = _local2.substring((_local5 + 1));
                };
                _local3 = (((_local4 + _local2) + " - ") + _arg1.message);
                needsLineFeed = true;
            } else {
                _local6 = (needsLineFeed) ? "\n" : "";
                _local3 = (((((((_local6 + "  *** ") + _arg1.level) + " *** ") + _local2) + " ***\n") + _arg1.message) + "\n");
                if (_arg1.error != null){
                    _local7 = _arg1.error.getStackTrace();
                    if (((!((_local7 == null))) && ((_local7.length > 0)))){
                        _local3 = (_local3 + (_local7 + "\n"));
                    };
                };
                needsLineFeed = false;
            };
            trace(_local3);
        }

    }
}//package org.spicefactory.lib.logging.impl 
