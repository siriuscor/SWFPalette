package 
{
    import com.bit101.components.*;
    import com.talentwalker.palette.BitArray;
    import com.talentwalker.palette.PaletteBuilder;
    import com.talentwalker.palette.PaletteChanger;
    import com.talentwalker.palette.SwfUncompresser;
    import com.talentwalker.palette.alloctaor.*;
    import com.talentwalker.palette.colouriser.*;
    import com.talentwalker.palette.colouriser.defineobject.*;
    import com.talentwalker.palette.colouriser.line.*;
    
    import flash.display.Loader;
    import flash.display.Sprite;
    import flash.events.*;
    import flash.net.*;
    import flash.system.*;
    import flash.utils.*;
    public class PaletteSample extends Sprite
    {
        public var bytes:BitArray;
        public function PaletteSample()
        {
			buildUI();
			return;
            bytes = new BitArray();
            load("m_bear.swf");
        }
        
        public function buildUI():void {
            
            var comp = new com.bit101.components.ColorChooser();
            addChild(comp);
        }
		
        public function load(url:String){ 
            var loader:URLLoader = loader;
            var request:URLRequest = new URLRequest(url);
            var stream:URLStream = new URLStream();
            stream.endian = Endian.LITTLE_ENDIAN;
            stream.addEventListener(Event.COMPLETE, handleSwfLoadComplete, false, 0, false);
            try {
                stream.load(request);
            } catch(error:Error) {
                trace(error);
            };
        }
        
        public function handleSwfLoadComplete(e:Event) {
            var stream = e.currentTarget;
            stream.readBytes(bytes);
            bytes = process(bytes);
            var loader:Loader = new Loader();
            stage.addChild(loader);
            loader.loadBytes(bytes);
        }
        
        public function process(bytes:BitArray) {
            
            var palette = PaletteBuilder.build(bytes);
            trace(palette);
            var changer = new PaletteChanger(bytes);
            changer.loadPalette(palette);
            changer.replace(0xFFCF03,0x000000);
            changer.replace(0x8E4A11,0xFF0000);
            bytes = changer.apply();
            
            return bytes;
        }
    }
}