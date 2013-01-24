package states
{
	import flash.display.Stage;
	import flash.utils.setTimeout;
	
	import core.Assets;
	import core.Game;
	
	import interfaces.IState;
	
	import managers.ButtonManager;
	import managers.CollisionManager;
	import managers.MonsterManager;
	import managers.ParticleManager;
	import managers.RobotManager;
	import managers.VisualManager;
	
	import objects.Background;
	import objects.Level;
	import objects.Life;
	import objects.Score;
	
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Play extends Sprite implements IState
	{
		public var game:Game;
		public var background:Background;
		
		public var monsterManager:MonsterManager;
		private var collisionManager:CollisionManager;
		public var particleManager:ParticleManager;
		public var robotManager:RobotManager;
		public var buttonManager:ButtonManager;
		
		private var ns:Stage;
		public var score:Score;
		public var life:Life;
		public var LIFE:int;
		public var damage:int=0;
		public var level:Level;
		public var LEVEL:int;
		public var kills:int;
		public var wait:Boolean=false;
		
		public function Play(game:Game)
		{
			this.game = game;
			LIFE = 300;
			LEVEL = 1;
			kills = 0;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			ns = Starling.current.nativeStage;
			
			//set Background==============
			background = new Background();
			addChild(background);
			//----------------------------
			
			//set Robot===============
			robotManager = new RobotManager(this);
			//------------------------
						
			//set Score=========
			score = new Score(32);
			addChild(score);
			score.x = 150;
			score.y = 400;
			//------------------
			
			//set Life==========
			life = new Life(LIFE);
			addChild(life);
			life.x = 255;
			life.y = 75;
			//------------------
			
			//Manager for hits, monsters, collisions, visual, and explosions
			monsterManager = new MonsterManager(this);
			collisionManager = new CollisionManager(this, life);
			particleManager = new ParticleManager(this);
			//------------------------------------------------------

			//set music and visualizer------------------------
			if(game.mute == false)
				Assets.mSoundC = Assets.erz.play(0,999);
			var visual:VisualManager = new VisualManager(this);
			addChild(visual)
			//---------------------------------
			
			//set level, show and then remove
			level = new Level();
			addChild(level);
			level.x = 100;
			level.y = 100;
			setTimeout(removeLevel, 1500);
			
			
			//set game play buttons-------------------------
			buttonManager = new ButtonManager(this);
			//----------------------------------------------
		}
	
		public function update():void
		{
			//background.update();
			buttonManager.update();
			monsterManager.update();
			collisionManager.update();
			
			levelUP();
		}
		
		//update life bar-------------------------------
		private function levelUP():void{
			if(kills == 10){
				LEVEL +=1;
				kills =0;
				level.setText(LEVEL);
				addChild(level);
				life.update(100);
				monsterManager.speed();
				setTimeout(removeLevel, 1500);
			}
		}
		//=================================================
		
		private function removeLevel():void{
			removeChild(level);
		}
		
		public function destroy():void
		{
			//set final score
			game.finalScore = parseInt(score.score.text);
			//----------------
			
			//stop music
			Assets.mSoundC.stop();
			//----------

			//remove life, level and score
			life.destroy();
			score.destroy();
			level.destroy();
			
			//remove buttons
			buttonManager.destroy();

			//remvoe managers
			monsterManager.destroy();
			robotManager.destroy();
			particleManager.destroy();
			
			removeFromParent(true);
		}
	}
}