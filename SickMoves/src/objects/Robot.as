package objects
{
	import core.Assets;
	
	import starling.display.Sprite;
	import starling.display.MovieClip;
	import starling.textures.Texture;
		
	public class Robot extends Sprite
	{
		
		public var alive:Boolean;
		
		//different robot moves
		private var d1:MovieClip;
		private var d2:MovieClip;
		private var d3:MovieClip;
		private var d4:MovieClip;
		private var d5:MovieClip;
		private var d6:MovieClip;
		private var d7:MovieClip;
		
		public var rob:Vector.<MovieClip>;
		
		public function Robot()
		{
			alive = false;
			
			//get frames
			var df1:Vector.<Texture> = Assets.ta.getTextures("rb");
			var df2:Vector.<Texture> = Assets.ta.getTextures("hr");
			var df3:Vector.<Texture> = Assets.ta.getTextures("da");
			var df4:Vector.<Texture> = Assets.ta.getTextures("db");
			var df5:Vector.<Texture> = Assets.ta.getTextures("dc");
			var df6:Vector.<Texture> = Assets.ta.getTextures("dd");
			var df7:Vector.<Texture> = Assets.ta.getTextures("miss");
			
			d1 = new MovieClip(df1, 5);
			d2 = new MovieClip(df2, 5);
			d3 = new MovieClip(df3, 5);
			d4 = new MovieClip(df4, 5);
			d5 = new MovieClip(df5, 5);
			d6 = new MovieClip(df6, 5);
			d7 = new MovieClip(df7, 5);
			
			rob = new Vector.<MovieClip>();
			rob[0] = d1;
			rob[1] = d2;
			rob[2] = d3;
			rob[3] = d4;
			rob[4] = d5;
			rob[5] = d6;
			rob[6] = d7;
			
			d1.x = 200;
			d1.y = 205;
			d2.x = 200;
			d2.y = 205;
			d3.x = 200;
			d3.y = 205;
			d4.x = 200;
			d4.y = 205;
			d5.x = 200;
			d5.y = 205;
			d6.x = 200;
			d6.y = 205;
			d7.x = 200;
			d7.y = 205;
			
		}
	}
}