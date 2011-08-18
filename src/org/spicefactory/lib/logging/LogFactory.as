//Created by Action Script Viewer - http://www.buraks.com/asv
package org.spicefactory.lib.logging {

    public interface LogFactory {

        function addLogLevel(_arg1:Object, _arg2:LogLevel):void;
        function setRootLogLevel(_arg1:LogLevel):void;
        function getLogger(_arg1:Object):ILogger;
        function addAppender(_arg1:Appender):void;
        function refresh():void;

    }
}//package org.spicefactory.lib.logging 
