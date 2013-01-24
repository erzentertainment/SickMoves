package objects
{
	import starling.display.Sprite;
	import starling.text.TextField;
	
	public class Level extends Sprite
	{
		private var level:TextField;
		public function Level()
		{
			level = new TextField(350,300,"1","comic sans", 120, 0xFFFFFF);
			level.hAlign = "right";
			level.bold = true;
			addChild(level);
		}
		
		public function setText(l:int):void{
			level.text = l.toString();
		}
		
		public function destroy():void{
			level.removeFromParent(true);
			level = null;
		}
	}
}