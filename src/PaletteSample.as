package 
{
    import com.bit101.components.*;
    import com.talentwalker.palette.BitArray;
    import com.talentwalker.palette.PaletteBuilder;
    import com.talentwalker.palette.PaletteChanger;
    import com.talentwalker.palette.SwfUncompresser;
    
    import flash.display.Loader;
    import flash.display.Sprite;
    import flash.events.*;
    import flash.net.*;
    import flash.system.*;
    import flash.utils.*;
    public class PaletteSample extends Sprite
    {
        private var bytes:BitArray;
        
        private var canvas:Panel;
        private var colorList:VBox;
        
        private var paletteData:Object;
        private var colors:Array;
        private var canvasLoader:Loader;
        public function PaletteSample()
        {
            canvasLoader = new Loader();
			buildUI();
        }
        
        public function buildUI():void {
            colorList = new VBox(this,0,0);
            canvas = new Panel(this,100,0);
            canvas.width = 400;
            canvas.height = 300;
            canvas.addChild(canvasLoader);
            bytes = new BitArray();
            load("m_bear.swf");
        }
        
        public function colorChange(e:Event) {
            var chooser:ColorChooser = e.currentTarget as ColorChooser;
            var from:uint = uint(chooser.name);
            var to:uint = uint(chooser.value);
            
            var changer = new PaletteChanger(bytes);
            changer.loadPalette(paletteData);
            changer.replace(from,to);
            bytes = changer.apply();
            this.loadCanvas(bytes);
        }
        
        public function buildPaletteUI() {
            colors = [];
            for(var color in paletteData) {
                colors.push(color);
            }
            colors.sort();
            
            for each(var color in colors) {
                var cc:ColorChooser = new ColorChooser(colorList);
                cc.usePopup = true;
                cc.value = color;
                cc.name = color + "";
                cc.addEventListener(Event.CHANGE,colorChange);
            }
        }
        
        public function loadCanvas(bytes):void {
            canvasLoader.loadBytes(bytes);
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
            bytes = SwfUncompresser.uncompress(bytes) as BitArray;
            paletteData = PaletteBuilder.build(bytes);
            
            this.buildPaletteUI();
            this.loadCanvas(bytes);
        }
        
    }
}