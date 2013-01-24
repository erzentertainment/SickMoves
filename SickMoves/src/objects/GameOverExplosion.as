package objects
{
	import core.Assets;
	
	import starling.extensions.PDParticleSystem;

	public class GameOverExplosion extends PDParticleSystem
	{
		public function GameOverExplosion()
		{
			super(XML(new Assets.gameoverXML()), Assets.ta.getTexture("robotHit"));
		}
	}
}