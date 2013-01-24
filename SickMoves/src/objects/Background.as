package objects
{
	import core.Assets;
	
	import starling.display.BlendMode;
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Background extends Sprite
	{
		public var back1:Image;
		private var back2:Image;
		
		public function Background()
		{
			back1 = new Image(Assets.backTexture);
			back1.blendMode = BlendMode.NONE;
			addChild(back1);
		}
		
		public function update():void
		{	
		}
	}
}