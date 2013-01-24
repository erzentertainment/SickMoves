package states
{
	import core.Assets;
	import core.Game;
	
	import interfaces.IState;
	
	import objects.Background;
	import objects.Title;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Menu extends Sprite implements IState
	{
		private var game:Game;
		private var background:Background;
		private var play:Button;
		private var mute1:Button;
		private var mute2:Button;
		private var title:Title;
		
		public function Menu(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		
		
			title = new Title();
			Starling.juggler.add(title);
			addChild(title);
		}
		
		private function init(event:Event):void
		{		
			if(game.mute == false)
				Assets.iSoundC = Assets.intro.play(0,999);
			play = new Button(Assets.ta.getTexture("play"));
			play.addEventListener(Event.TRIGGERED, onPlay);
			play.pivotX = play.width * .5;
			play.x = 400;
			play.y = 380;
			addChild(play);
			mute1 = new Button(Assets.ta.getTexture("mute1"));
			mute1.addEventListener(Event.TRIGGERED,onMute);
			mute1.pivotX = play.width *.5;
			mute1.x = 700;
			mute1.y = 380;
			mute2 = new Button(Assets.ta.getTexture("mute2"));
			mute2.addEventListener(Event.TRIGGERED,offMute);
			mute2.pivotX = play.width *.5;
			mute2.x = 700;
			mute2.y = 380;
			
			if(game.mute == false)
				addChild(mute1);
			else
				addChild(mute2);
				
		}
		
		private function onPlay(event:Event):void
		{
			game.changeState(Game.PLAY_STATE);
		}
		
		private function onMute(event:Event):void{
			game.mute = true;
			Assets.iSoundC.stop();
			removeChild(mute1);
			addChild(mute2);
		}
		
		private function offMute(event:Event):void{
			game.mute = false;
			Assets.iSoundC = Assets.intro.play(0,999);
			removeChild(mute2);
			addChild(mute1);
		}
		
		public function update():void
		{
			if(game.mute == true)
				Assets.iSoundC.stop();
			//background.update();
		}
		
		public function destroy():void
		{
			Assets.iSoundC.stop();
			title.removeFromParent(true);
			title = null;
			play.removeFromParent(true);
			play = null;
			mute1.removeFromParent(true);
			mute1 = null;
			mute2.removeFromParent(true);
			mute2 = null;
			removeFromParent(true);
		}
	}
}