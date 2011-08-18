//Created by Action Script Viewer - http://www.buraks.com/asv
package org.spicefactory.lib.logging {
    import flash.events.*;

    public interface ILogger extends IEventDispatcher {

        function isErrorEnabled():Boolean;
        function get level():LogLevel;
        function trace(_arg1:String, _arg2:Error=null):void;
        function isTraceEnabled():Boolean;
        function isFatalEnabled():Boolean;
        function set level(_arg1:LogLevel):void;
        function isInfoEnabled():Boolean;
        function get name():String;
        function warn(_arg1:String, _arg2:Error=null):void;
        function info(_arg1:String, _arg2:Error=null):void;
        function error(_arg1:String, _arg2:Error=null):void;
        function isWarnEnabled():Boolean;
        function debug(_arg1:String, _arg2:Error=null):void;
        function isDebugEnabled():Boolean;
        function fatal(_arg1:String, _arg2:Error=null):void;

    }
}//package org.spicefactory.lib.logging 
