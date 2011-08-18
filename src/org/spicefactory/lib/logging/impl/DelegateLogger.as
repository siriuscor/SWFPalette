//Created by Action Script Viewer - http://www.buraks.com/asv
package org.spicefactory.lib.logging.impl {
    import flash.events.*;
    import org.spicefactory.lib.logging.*;

    public class DelegateLogger implements ILogger {

        private var _delegate:ILogger;

        public function DelegateLogger(_arg1:ILogger){
            _delegate = _arg1;
        }
        public function dispatchEvent(_arg1:Event):Boolean{
            return (_delegate.dispatchEvent(_arg1));
        }
        public function get level():LogLevel{
            return (_delegate.level);
        }
        public function get delegate():ILogger{
            return (_delegate);
        }
        public function isTraceEnabled():Boolean{
            return (_delegate.isTraceEnabled());
        }
        public function set delegate(_arg1:ILogger):void{
            _delegate = _arg1;
        }
        public function trace(_arg1:String, _arg2:Error=null):void{
            _delegate.trace(_arg1, _arg2);
        }
        public function get name():String{
            return (_delegate.name);
        }
        public function warn(_arg1:String, _arg2:Error=null):void{
            _delegate.warn(_arg1, _arg2);
        }
        public function set level(_arg1:LogLevel):void{
            _delegate.level = _arg1;
        }
        public function isWarnEnabled():Boolean{
            return (_delegate.isWarnEnabled());
        }
        public function removeEventListener(_arg1:String, _arg2:Function, _arg3:Boolean=false):void{
            _delegate.removeEventListener(_arg1, _arg2, _arg3);
        }
        public function debug(_arg1:String, _arg2:Error=null):void{
            _delegate.debug(_arg1, _arg2);
        }
        public function fatal(_arg1:String, _arg2:Error=null):void{
            _delegate.fatal(_arg1, _arg2);
        }
        public function error(_arg1:String, _arg2:Error=null):void{
            _delegate.error(_arg1, _arg2);
        }
        public function isErrorEnabled():Boolean{
            return (_delegate.isErrorEnabled());
        }
        public function addEventListener(_arg1:String, _arg2:Function, _arg3:Boolean=false, _arg4:int=0, _arg5:Boolean=false):void{
            _delegate.addEventListener(_arg1, _arg2, _arg3, _arg4, _arg5);
        }
        public function isFatalEnabled():Boolean{
            return (_delegate.isFatalEnabled());
        }
        public function willTrigger(_arg1:String):Boolean{
            return (_delegate.willTrigger(_arg1));
        }
        public function isInfoEnabled():Boolean{
            return (_delegate.isInfoEnabled());
        }
        public function hasEventListener(_arg1:String):Boolean{
            return (_delegate.hasEventListener(_arg1));
        }
        public function info(_arg1:String, _arg2:Error=null):void{
            _delegate.info(_arg1, _arg2);
        }
        public function isDebugEnabled():Boolean{
            return (_delegate.isDebugEnabled());
        }

    }
}//package org.spicefactory.lib.logging.impl 
