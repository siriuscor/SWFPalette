package com.talentwalker.palette
{
    import flash.utils.ByteArray;

    public class SwfUncompresser
    {
        public static const COMPRESS_FLAG = 67;
        public static function uncompress(bytes:ByteArray):ByteArray {
            var compressFlag = bytes.readByte();
            if (compressFlag == COMPRESS_FLAG) {
                bytes.position = 8;
                var data:ByteArray = new ByteArray();
                bytes.readBytes(data);
                
                data.uncompress();
                data.position = 0;
                data.readBytes(bytes, 8);
                
                bytes.position = 0;
                bytes.writeByte(70);
                bytes.writeByte(87);
                bytes.writeByte(83);
            }
            bytes.position = 0;
            return bytes;
        }
    }
}