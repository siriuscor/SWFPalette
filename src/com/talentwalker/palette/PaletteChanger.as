package com.talentwalker.palette
{
    import flash.utils.ByteArray;

    /*
    var changer = new PaletteChanger();
    changer.loadPalette(palette);
    changer.loadBytes(bytes);
    changer.replace(123,456);
    bytes = changer.apply();
    */
    public class PaletteChanger
    {
        private var bytes:ByteArray;
        private var palette:Object;
        private var mapping:Object;
        public function PaletteChanger(bytes:ByteArray)
        {
            this.bytes = bytes;
            mapping = {};
            palette = {};
        }
        
        public function loadPalette(palette:Object):void {
            this.palette = palette;
        }
        
        public function replace(origin:uint, replace:uint):void {
            if (origin == replace) return;
            mapping[origin] = replace;
        }
        
        public function apply():ByteArray {
            var b:BitArray = bytes as BitArray;
            for(var color in mapping) {
                var replace:uint = mapping[color];
                var blue = replace & 0xFF;
                var green = (replace & 0xFF00) >> 8;
                var red = (replace & 0xFF0000) >> 16;
                var ptrs = palette[color];
                if (ptrs == null) continue;
                for(var i in ptrs) {
                    var ptr = ptrs[i];
                    b.setPointer(ptr);
                    b.writeWord(red, 1);
                    b.writeWord(green, 1);
                    b.writeWord(blue, 1);
                }
            }
            return b;
        }
        
    }
}