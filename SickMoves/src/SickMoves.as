package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;
	import flash.desktop.NativeApplication;
	
	import core.Game;
	
	import starling.core.Starling;
	import starling.events.ResizeEvent;
	
	[SWF(width=800, height=480, frameRate=60, backgroundColor=0x000000)]
	public class SickMoves extends Sprite
	{
		public function SickMoves()
		{		
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var viewPortRectangle:Rectangle = new Rectangle();
			viewPortRectangle.width = 800;
			viewPortRectangle.height = 480;
			
			//var star:Starling = new Starling(Game, stage,null,null,"auto","baseline");
			var star:Starling = new Starling(Game, stage,viewPortRectangle);
			star.antiAliasing = 2;
			star.start();
			
			stage.addEventListener(ResizeEvent.RESIZE, resizeStage);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, exit);
		}
		
		private function exit(event:KeyboardEvent):void{
			if (event.keyCode == Keyboard.BACK){
				NativeApplication.nativeApplication.exit();
			}
				
		}
		
		private function resizeStage(e:Event):void
		{
			var viewPortRectangle:Rectangle = new Rectangle();
			viewPortRectangle.width = stage.stageWidth;
			viewPortRectangle.height = stage.stageHeight;
			Starling.current.viewPort = viewPortRectangle;
		}
	}
}