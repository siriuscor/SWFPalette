//Created by Action Script Viewer - http://www.buraks.com/asv
package org.spicefactory.lib.logging {

    public interface Appender {

        function registerLogger(_arg1:ILogger):void;
        function get threshold():LogLevel;
        function set threshold(_arg1:LogLevel):void;

    }
}//package org.spicefactory.lib.logging 
