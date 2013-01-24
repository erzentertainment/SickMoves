package objects
{
	import core.Assets;
	import starling.display.MovieClip;
	
	public class Title extends MovieClip
	{
		public function Title()
		{
			super(Assets.title.getTextures("TitleScreen"), 4);
		}
	}
}