//Created by Action Script Viewer - http://www.buraks.com/asv
package org.spicefactory.lib.errors {

    public class NestedError extends Error {

        private var _cause:Error;

        public function NestedError(_arg1:String="", _arg2:Error=null, _arg3:int=0){
            super(_arg1, _arg3);
            _cause = _arg2;
        }
        override public function getStackTrace():String{
            var _local1:String = super.getStackTrace();
            if (_cause != null){
                _local1 = (_local1 + ("\nCaused by: " + _cause.getStackTrace()));
            };
            return (_local1);
        }
        public function get cause():Error{
            return (_cause);
        }

    }
}//package org.spicefactory.lib.errors 
