package objects
{
	import starling.display.Sprite;
	import starling.text.TextField;
	
	public class Score extends Sprite
	{
		public var score:TextField;
		public function Score(s:int)
		{
			score = new TextField(300,100,"0","comic sans", s, 0xFFFFFF);
			score.hAlign = "right";
			addChild(score);
		}
		
		public function addScore(amt:Number):void
		{
			score.text = (parseInt(score.text) + amt).toString();
		}
		
		public function minusScore(amt:Number):void{
			if(parseInt(score.text)-amt < 0)
				score.text = "0";			
			else
				score.text = (parseInt(score.text) - amt).toString();
		}
		
		public function destroy():void{
			score.removeFromParent(true);
			score = null;
		}
	}
}