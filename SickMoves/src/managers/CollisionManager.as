package managers
{
	import flash.geom.Point;
	import flash.utils.setTimeout;
	
	import core.Assets;
	import core.Game;
	
	import objects.Life;
	import objects.Monster;
	
	import states.Play;

	public class CollisionManager
	{
		private var play:Play;
		private var life:Life;
		private var p1:Point = new Point();
		private var p2:Point = new Point();
		private var count:int = 0;
		
		public function CollisionManager(play:Play, life:Life)
		{
			this.play = play;
			this.life = life;
		}
		
		public function update():void
		{
			if(count & 1)
				botAndMonsters();
			
			count++;
		}
		
		private function botAndMonsters():void
		{	
			var mon:Monster;
			switch(play.monsterManager.current){
				case 1: mon = play.monsterManager.mon1; damage(mon); break;
				case 2: mon = play.monsterManager.mon2; damage(mon); break;
				case 3: mon = play.monsterManager.mon3; damage(mon); break;
				case 4: mon = play.monsterManager.mon4; damage(mon); break;
			}
		}
		
		private function damage(mon:Monster):void{
			if(mon.alive == true && mon.x < 275){
				play.life.update(-30);
				
				if(play.life.life <= 0 ){
					play.monsterManager.destroyMonster(mon);
					gameover();
				}
				else{
					play.monsterManager.destroyMonster(mon);
				
					play.robotManager.spawn(1);
					play.particleManager.spawn2(250,275);
					if(play.game.mute == false)
						Assets.damage.play();
					setTimeout(recover,300);	
				}
			}
		}
		
		private function gameover():void{
			play.robotManager.bot.alive = false;
			play.monsterManager.holdon = true;
			play.robotManager.spawn(1);
			play.particleManager.spawn3(250,275);
			if(play.game.mute == false)
				Assets.gameover.play();
			setTimeout(holdon, 2000);
		}

		private function holdon():void{
			play.game.changeState(Game.GAME_OVER_STATE);
		}
		
		private function recover():void{
			play.robotManager.recover();
		}
		
		
	}
}