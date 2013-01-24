package managers
{
	import flash.media.SoundMixer;
	import flash.utils.ByteArray;
	
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	
	import states.Play;

	public class VisualManager extends Sprite
	{
		private var myByteArray:ByteArray;
		private var shape:Shape;
		private var play:Play;
		
		public function VisualManager(play:Play)
		{
			this.play = play;
			myByteArray = new ByteArray();
			shape = new Shape();
			addChild(shape);
			shape.x = 0;
			shape.y = 356;
			addEventListener(Event.ENTER_FRAME, readSpectrum);
		}
	
	
		private function readSpectrum(event:Event):void{
			shape.graphics.clear();
			SoundMixer.computeSpectrum(myByteArray, false, 0);
			var myArray:Array = new Array;
			for(var i:int = 0; i < 256; i += 8){
				myArray.push(myByteArray.readFloat());
			}
			drawSpectrum(myArray);
		}
		
		private function drawSpectrum(myFloatArray:Array):void{
			shape.graphics.lineStyle(5, 0xFFFFFF);
			for(var i:int = 1; i < myFloatArray.length; i++){
				if(i == 1){
					shape.graphics.moveTo(0, 0);
					shape.graphics.lineTo((i+2) * 25, myFloatArray[i+1] * 60);		
				}else{
					shape.graphics.moveTo((i+1) * 25, myFloatArray[i] * 60);
					shape.graphics.lineTo((i+2) * 25, myFloatArray[i+1] * 60);	
				}	
			}	
		}
	
	}
}