package com.talentwalker.palette
{
    import com.talentwalker.palette.alloctaor.*;
    import com.talentwalker.palette.colouriser.*;
    import com.talentwalker.palette.colouriser.defineobject.*;
    import com.talentwalker.palette.colouriser.line.*;
    
    import flash.utils.ByteArray;
    /*
    var builder:PaletteBuilder = new PaletteBuilder();
    builder.loadBytes(bytes);
    var palette:Object = builder.buildPalette();
    trace(palette);
    */
    public class PaletteBuilder
    {
        private var bytes:BitArray;
        private var parseState:ParseState;
        public function PaletteBuilder(bytes:ByteArray)
        {
            this.bytes = bytes as BitArray;
            parseState = new ParseState();
        }
        
        public function buildPalette():Object {
            bytes = SwfUncompresser.uncompress(bytes) as BitArray;
            bytes.position = 8;
            bytes.setPointer(bytes.position << 3);
            Allocator.alloc(Bounds).read(bytes);
            bytes.readFixedWord(8,8);
            bytes.readWord(2, false);
            while(decodeObject(bytes)){}    
            return parseState.palette;
        }
        
        public static function build(bytes):Object {
            var builder:PaletteBuilder = new PaletteBuilder(bytes);
            return builder.buildPalette();
        }
        
        private function decodeObject(_arg1:BitArray):Boolean{
            var _local2 = (_arg1.scanWord(2, false) >> 6);
            var _local3 = (_arg1.scanWord(2, false) & 63);
            var _local4:int = ((_arg1.getPointer() + 16) + (_local3 << 3));
            if (_local2 == 0){
                _arg1.setPointer(_local4);
                return (false);
            };
            if (_local3 == 63){
                _arg1.adjustPointer(16);
                _local3 = _arg1.scanWord(4, false);
                _local4 = ((_arg1.getPointer() + 32) + (_local3 << 3));
                _arg1.adjustPointer(-16);
            };
            switch (_local2){
                case MovieObject.DefineShape:
                    Allocator.alloc(DefineShape).read(_arg1, parseState);
                    break;
                case MovieObject.DefineShape2:
                    Allocator.alloc(DefineShape2).read(_arg1, parseState);
                    break;
                case MovieObject.DefineShape3:
                    Allocator.alloc(DefineShape3).read(_arg1, parseState);
                    break;
                case MovieObject.DefineShape4:
                    Allocator.alloc(DefineShape4).read(_arg1, parseState);
                    break;
                case MovieObject.DefineMorphShape:
                    Allocator.alloc(DefineMorphShape).read(_arg1, parseState);
                    break;
                case MovieObject.DefineMorphShape2:
                    Allocator.alloc(DefineMorphShape2).read(_arg1, parseState);
                    break;
                case MovieObject.SetBackgroundColor:
                    Allocator.alloc(SetBackgroundColor).read(_arg1, parseState);
                    break;
                case MovieObject.DefineSprite:
                    Allocator.alloc(DefineSprite).read(_arg1, parseState);
                    break;
            };
            _arg1.setPointer(_local4);
            return (true);
        }
    }
}