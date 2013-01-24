package objects
{
	import core.Assets;
	
	import starling.extensions.PDParticleSystem;
	
	public class Damage extends PDParticleSystem
	{
		public function Damage()
		{
			super(XML(new Assets.robotHitXML()), Assets.ta.getTexture("robotHit"));
		}
	}
}