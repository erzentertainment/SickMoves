package states
{
	import flash.utils.setTimeout;
	
	import core.Assets;
	import core.Game;
	
	import interfaces.IState;
	
	import objects.Background;
	
	import starling.display.BlendMode;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class GameOver extends Sprite implements IState
	{
		private var game:Game;
		private var background:Background;
		private var over:Image;
		private var tryAgain:Button;
		private var menu:Button;
		private var score:Image;
		private var finalScore:TextField;
		
		public function GameOver(game:Game)
		{
			this.game = game;
		
			score = new Image(Assets.scoreTexture);
			addChild(score);
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			if(game.mute == false)
				Assets.iSoundC = Assets.intro.play(0,999);
			over = new Image(Assets.overTexture);
			over.blendMode = BlendMode.NONE;
			addChild(over);
			
			setTimeout(scoreScreen, 1500);
		}
		
		private function scoreScreen():void{
			removeChild(over);	
			
			finalScore = new TextField(800,600, game.finalScore.toString(),"comic sans",120,0xFFFFFF);
			finalScore.bold = true;
			addChild(finalScore);
			
			tryAgain = new Button(Assets.ta.getTexture("play"));
			tryAgain.addEventListener(Event.TRIGGERED, onAgain);
			tryAgain.pivotX = tryAgain.width * .5;
			tryAgain.x = 200;
			tryAgain.y = 380;
			addChild(tryAgain);
			
			menu = new Button(Assets.ta.getTexture("menu"));
			menu.addEventListener(Event.TRIGGERED, onMenu);
			menu.pivotX = menu.width * .5;
			menu.x = 550;
			menu.y = 380;
			addChild(menu);
		}
		
		private function onAgain():void
		{
			tryAgain.removeEventListener(Event.TRIGGERED, onAgain);
			game.changeState(Game.PLAY_STATE);	
		}
		
		private function onMenu():void{
			menu.removeEventListener(Event.TRIGGERED, onMenu);
			game.changeState(Game.MENU_STATE);
		}
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
			if(game.mute == false)
				Assets.iSoundC.stop();
			over.removeFromParent(true);
			over = null;
			score.removeFromParent(true);
			score = null;
			tryAgain.removeFromParent(true);
			tryAgain = null;
			menu.removeFromParent(true);
			menu = null;
			removeFromParent(true);
		}
	}
}