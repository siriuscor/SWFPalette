//Created by Action Script Viewer - http://www.buraks.com/asv
package com.talentwalker.palette {
    import flash.utils.*;

    public class BitArray extends ByteArray {

        private var ptr:Number;

        public function BitArray(){
            ptr = 0;
        }
        public function readWord(_arg1:int, _arg2:Boolean):int{
            return (_readWord((_arg1 * 8), _arg2));
        }
        private function getByteAtIndex(_arg1:int):int{
            var _local2:int = this.position;
            this.position = _arg1;
            var _local3:int = this.readByte();
            this.position = _local2;
            return (_local3);
        }
        public function readBits(_arg1:int, _arg2:Boolean):int{
            var _local3:int;
            if (_arg1 == 0){
                return (_local3);
            };
            var _local4 = (ptr >> 3);
            var _local5:int = (((this.length - _local4))>4) ? 0 : ((4 - (this.length - _local4)) * 8);
            var _local6 = 32;
            while (_local6 > _local5) {
                _local3 = (_local3 | ((this.getByteAtIndex(_local4) & 0xFF) << (_local6 - 8)));
                _local6 = (_local6 - 8);
                _local4++;
            };
            _local3 = (_local3 << (ptr % 8));
            if (_arg2){
                _local3 = (_local3 >> (32 - _arg1));
            } else {
                _local3 = (_local3 >>> (32 - _arg1));
            };
            ptr = (ptr + _arg1);
            return (_local3);
        }
        public function readFixedBits(_arg1:int, _arg2:int):Number{
            var _local3:Number = 0;
            var _local4:Number = (1 << _arg2);
            _local3 = (readBits(_arg1, true) / _local4);
            return (_local3);
        }
        public function adjustPointer(_arg1:Number):void{
            ptr = (ptr + _arg1);
        }
        public function scanWord(_arg1:Number, _arg2:Boolean):int{
            var _local3:int;
            var _local4:int = ptr;
            _local3 = _readWord((_arg1 * 8), _arg2);
            ptr = _local4;
            return (_local3);
        }
        public function readFixedWord(_arg1:int, _arg2:int):Number{
            var _local3:Number = 0;
            var _local4:Number = (1 << _arg2);
            var _local5:int = _readWord(_arg2, false);
            var _local6:int = _readWord(_arg1, true);
            _local6 = (_local6 << _arg2);
            _local3 = ((_local6 + _local5) / _local4);
            return (_local3);
        }
        public function writeWord(bits:int, count:int):void{
            var byte_count:int = (count * 8);
            var pos:int = (ptr >>> 3);
            var temp:int = 0;
            while (temp < byte_count) {
                this[pos] = (bits & 0xFF);
                temp = (temp + 8);
                ptr = (ptr + 8);
                bits = (bits >>> 8);
                pos++;
            };
        }
        public function scanBits(_arg1:Number, _arg2:Boolean):int{
            var _local3:int;
            var _local4:int = ptr;
            _local3 = readBits(_arg1, _arg2);
            ptr = _local4;
            return (_local3);
        }
        public function readString(_arg1:int):String{
            if (_arg1 == 0){
                return ("");
            };
            var _local2:int = ptr;
            var _local3 = "";
            var _local4:ByteArray = readBytes2(_arg1);
            return (_local4.toString());
        }
        public function alignToByte():void{
//            ptr = (ptr + (((ptr % 8))>0) ? (8 - (ptr % 8)) : 0);
            ptr = (ptr+7) & ~7;
        }
        public function getPointer():int{
            return (ptr);
        }
        public function setPointer(_arg1:int):void{
            ptr = _arg1;
        }
        public function readBytes2(_arg1:int):ByteArray{
            var _local2:int = (ptr >>> 3);
            var _local3:ByteArray = new ByteArray();
            this.readBytes(_local3, _local2, _arg1);
            var _local4:int;
            while (_local4 < _arg1) {
                ptr = (ptr + 8);
                _local2++;
                _local4++;
            };
            return (_local3);
        }
        public function _readWord(_arg1:int, _arg2:Boolean):int{
            var _local3:int;
            if (_arg1 == 0){
                return (_local3);
            };
            var _local4 = (ptr >> 3);
            var _local5:int;
            while (_local5 < _arg1) {
                _local3 = (_local3 + ((this.getByteAtIndex(_local4) & 0xFF) << _local5));
                _local5 = (_local5 + 8);
                ptr = (ptr + 8);
                _local4++;
            };
            if (_arg2){
                _local3 = (_local3 << (32 - _arg1));
                _local3 = (_local3 >> (32 - _arg1));
            };
            return (_local3);
        }

    }
}//package 
