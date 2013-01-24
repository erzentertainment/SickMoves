package managers
{
	import objects.Monster;
	
	import starling.core.Starling;
	
	import states.Play;
	
	public class MonsterManager
	{
		private var play:Play;
		public var count:int = 0;
		public var mon1:Monster;
		public var mon2:Monster;
		public var mon3:Monster;
		public var mon4:Monster;
		
		//speed variables
		public var s1:int;
		public var s2:int;
		public var s3:int;
		public var s4:int;
		
		//monster speed variables that are distriubted randomly among the monsters every level
		public var ms1:int;
		public var ms2:int;
		public var ms3:int;
		public var ms4:int;
		
		public var holdon:Boolean;
		
		public var current:int;
		
		public function MonsterManager(play:Play)			
		{
			this.play = play;
			mon1 = new Monster("alien");
			mon2 = new Monster("ww");
			mon3 = new Monster("ghost");
			mon4 = new Monster("vp");
			s1=1;
			s2=2;
			s3=3;
			s4=4;
			speed();
			holdon = false;
		}
		
		public function update():void
		{			
			if(Math.random() < .03 && mon1.alive == false && mon2.alive == false && mon3.alive == false && mon4.alive == false && holdon == false)
				spawn(Math.random()*4+1);
			
			if(mon1.alive == true)
				mon1.x -=ms1;
			if(mon2.alive == true)
				mon2.x -=ms2;
			if(mon3.alive == true)
				mon3.x -=ms3;
			if(mon4.alive == true)
				mon4.x -=ms4;
		}		
		
		public function speed():void{
			//increase speed
			s1 +=1;s2 +=1;s3 +=1;s4 +=1;
			
			//random number to randomize the speed of each monster
			var i:int = Math.random()*4+1;
			switch(i){
				case 1:ms1=s1;ms2=s2;ms3=s3;ms4=s4;
					break;
				case 2:ms1=s2;ms2=s3;ms3=s4;ms4=s1;
					break;
				case 3:ms1=s3;ms2=s4;ms3=s1;ms4=s2;
					break;
				case 4:ms1=s4;ms2=s1;ms3=s2;ms4=s3;
					break;
			}
		}
		
		public function spawn(j:int):void
		{
			var m:Monster;
			
			
			switch(j){
				case 1: m = mon1; mon1.alive = true;
					break;
				case 2: m = mon2; mon2.alive = true;
					break;
				case 3: m = mon3; mon3.alive = true;
					break;
				case 4: m = mon4; mon4.alive = true;
					break;
			}
			
			current = j;
			
			Starling.juggler.add(m);
			play.addChild(m);
		}
		
		public function destroyMonster(m:Monster):void
		{
			Starling.juggler.remove(m);
			m.removeFromParent(true);
			m.alive = false;
			m.x = 800;
		}
		
		public function destroy():void
		{
			destroyMonster(mon1);
			destroyMonster(mon2);
			destroyMonster(mon3);
			destroyMonster(mon4);
			mon1 = null;
			mon2 = null;
			mon3 = null;
			mon4 = null;
		}
	}
}