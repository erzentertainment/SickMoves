package core
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{
		[Embed(source="../../assets/back.png")]
		private static var back:Class;
		public static var backTexture:Texture;
		
		[Embed(source="../../assets/gameover.png")]
		private static var over:Class;
		public static var overTexture:Texture;
		
		[Embed(source="../../assets/Score.png")]
		private static var score:Class;
		public static var scoreTexture:Texture;
		
		[Embed(source="../../assets/atlas.png")]
		private static var atlas:Class;
		public static var ta:TextureAtlas;
		
		[Embed(source="../../assets/atlas.xml", mimeType="application/octet-stream")]
		private static var atlasXML:Class;
		
		[Embed(source="../../assets/TitleScreen.png")]
		private static var titleScreen:Class;
		public static var title:TextureAtlas;
		
		[Embed(source="../../assets/TitleScreen.xml", mimeType="application/octet-stream")]
		private static var titleXML:Class;
		
		[Embed(source="../../assets/particle.pex", mimeType="application/octet-stream")]
		public static var particleXML:Class;
		
		[Embed(source="../../assets/robotHit.pex", mimeType="application/octet-stream")]
		public static var robotHitXML:Class;
		
		[Embed(source="../../assets/gameover.pex", mimeType="application/octet-stream")]
		public static var gameoverXML:Class;
		
		[Embed(source="../../assets/sounds/explosion.mp3")]
		private static var explosionSound:Class;
		public static var explosion:Sound;
		
		[Embed(source="../../assets/sounds/robotHit.mp3")]
		private static var damageSound:Class;
		public static var damage:Sound;
		
		[Embed(source="../../assets/sounds/miss.mp3")]
		private static var missSound:Class;
		public static var miss:Sound;
		
		[Embed(source="../../assets/sounds/erz.mp3")]
		public static var erzSound:Class;
		public static var erz:Sound;
		public static var mSoundC:SoundChannel;
		
		[Embed(source="../../assets/sounds/gameover.mp3")]
		public static var gameoverSound:Class;
		public static var gameover:Sound;
		
		[Embed(source="../../assets/sounds/intro.mp3")]
		public static var introSound:Class;
		public static var intro:Sound;
		public static var iSoundC:SoundChannel;

		public static function init():void
		{
			//menu,play,and over state, background textures
			backTexture = Texture.fromBitmap(new back());
			scoreTexture = Texture.fromBitmap(new score());
			overTexture = Texture.fromBitmap(new over());
			//---------------------------------------------
			
			ta = new TextureAtlas(Texture.fromBitmap(new atlas()),
				XML(new atlasXML()));
			
			title = new TextureAtlas(Texture.fromBitmap(new titleScreen()),
				XML(new titleXML()));
			
			explosion = new explosionSound();
			explosion.play(0,0, new SoundTransform(0));
			damage = new damageSound();
			damage.play(0,0, new SoundTransform(0));
			miss = new missSound();
			miss.play(0,0,new SoundTransform(0));
			gameover = new gameoverSound();
			gameover.play(0,0, new SoundTransform(0));
			intro = new introSound();
			iSoundC = new SoundChannel();
			iSoundC = intro.play(0,0, new SoundTransform(0));
			
			erz = new erzSound();
			mSoundC = new SoundChannel();
			mSoundC = erz.play(0,0,new SoundTransform(0));
		}
	}
}