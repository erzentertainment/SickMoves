package managers
{
	import com.leebrimelow.starling.StarlingPool;
	
	import objects.Damage;
	import objects.Explosion;
	import objects.GameOverExplosion;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	import states.Play;
	
	public class ParticleManager
	{
		private var play:Play;
		private var pool:StarlingPool;
		private var pool2:StarlingPool;
		private var pool3:StarlingPool;
		
		public function ParticleManager(play:Play)
		{
			this.play = play;
			pool = new StarlingPool(Explosion, 15);
			pool2 = new StarlingPool(Damage, 15);
			pool3 = new StarlingPool(GameOverExplosion, 5);
		}
		
		public function spawn(x:int, y:int):void
		{
			var ex:Explosion = pool.getSprite() as Explosion;
			ex.emitterX = x;
			ex.emitterY = y;
			ex.start(.1);
			play.addChild(ex);
			Starling.juggler.add(ex);
			ex.addEventListener(Event.COMPLETE, onComplete);
		}
		
		private function onComplete(event:Event):void
		{
			var ex:Explosion = event.currentTarget as Explosion;
			Starling.juggler.remove(ex);
		
			if(pool != null)
				pool.returnSprite(ex);
		}
		
		public function spawn2(x:int, y:int):void
		{
			var d:Damage = pool2.getSprite() as Damage;
			d.emitterX = x;
			d.emitterY = y;
			d.start(.1);
			play.addChild(d);
			Starling.juggler.add(d);
			d.addEventListener(Event.COMPLETE, onComplete2);
		}
		
		private function onComplete2(event:Event):void
		{
			var d:Damage = event.currentTarget as Damage;
			Starling.juggler.remove(d);
			
			if(pool2 != null)
				pool2.returnSprite(d);
		}
		
		public function spawn3(x:int, y:int):void
		{
			var g:GameOverExplosion = pool3.getSprite() as GameOverExplosion;
			g.emitterX = x;
			g.emitterY = y;
			g.start(.1);
			play.addChild(g);
			Starling.juggler.add(g);
			g.addEventListener(Event.COMPLETE, onComplete3);
		}
		
		private function onComplete3(event:Event):void
		{
			var g:GameOverExplosion = event.currentTarget as GameOverExplosion;
			Starling.juggler.remove(g);
			
			if(pool3 != null)
				pool3.returnSprite(g);
		}
		
		public function destroy():void
		{
			var i:int;
			for(i=0; i<pool.items.length;i++){
				var ex:Explosion = pool.items[i];
				ex.dispose();
				ex = null;
			}
			for(i=0; i<pool2.items.length;i++){
				var d:Damage = pool2.items[i];
				d.dispose();
				d = null;
			}
			for(i=0; i<pool3.items.length;i++){
				var g:GameOverExplosion = pool3.items[i];
				g.dispose();
				g = null;
			}
			pool.destroy();
			pool = null;
			pool2.destroy();
			pool2 = null;
			pool3.destroy();
			pool3 = null;
		}
	}
}