package objects
{
	import core.Assets;
	
	import starling.extensions.PDParticleSystem;
	
	public class Explosion extends PDParticleSystem
	{
		public function Explosion()
		{
			super(XML(new Assets.particleXML()), Assets.ta.getTexture("texture"));
		}
	}
}