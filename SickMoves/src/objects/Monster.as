package objects
{
	import core.Assets;
	
	import starling.display.MovieClip;
	
	public class Monster extends MovieClip
	{
		public var alive:Boolean;
		public function Monster(mon:String)
		{		
			super(Assets.ta.getTextures(mon), 5);
			pivotX = width *.5;
			pivotY = height * .5;
			alive = false;
			x = 800;
			y = 278;
		}
	}
}