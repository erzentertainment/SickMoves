package managers
{
	import objects.Robot;
	
	import starling.core.Starling;
	
	import states.Play;
	
	public class RobotManager
	{
		private var play:Play;
		public var bot:Robot;
		private var current:int;
		public function RobotManager(play:Play)
		{
			this.play = play;
			bot = new Robot();

			bot.alive = true;
			current =0;
			play.addChild(bot.rob[current]);
			Starling.juggler.add(bot.rob[current]);
		}
		
		public function spawn(i:int):void{
			Starling.juggler.remove(bot.rob[current]);
			play.removeChild(bot.rob[current]);
			current = i;
			Starling.juggler.add(bot.rob[i]);
			play.addChild(bot.rob[i]);
		}
		
		public function recover():void{
			Starling.juggler.remove(bot.rob[current]);
			play.removeChild(bot.rob[current]);
			current = 0;
			Starling.juggler.add(bot.rob[current]);
			play.addChild(bot.rob[current]);
		}
		
		public function destroy():void{
			Starling.juggler.remove(bot.rob[current]);
			bot.removeFromParent(true);
		}
	}
}