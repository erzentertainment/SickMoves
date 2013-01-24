package managers
{
	import flash.utils.setTimeout;
	
	import core.Assets;
	
	import objects.Monster;
	
	import starling.display.Button;
	import starling.events.Event;
	import starling.events.TouchEvent;
	
	import states.Play;

	public class ButtonManager
	{
		private var play:Play;
		private var b1:Button;
		private var b2:Button;
		private var b3:Button;
		private var b4:Button;
		private var b1off:Button;
		private var b2off:Button;
		private var b3off:Button;
		private var b4off:Button;

		public function ButtonManager(play:Play)
		{
			this.play = play;

			b1 = new Button(Assets.ta.getTexture("b1"));
			b1.pivotX = b1.width * .5;
			b1.x = 50;
			b1.y = 380;
			b2 = new Button(Assets.ta.getTexture("b2"));
			b2.pivotX = b2.width * .5;
			b2.x = 50;
			b2.y = 0;
			b3 = new Button(Assets.ta.getTexture("b3"));
			b3.pivotX = b3.width * .5;
			b3.x = 750;
			b3.y = 0;
			b4 = new Button(Assets.ta.getTexture("b4"));
			b4.pivotX = b4.width * .5;
			b4.x = 750;
			b4.y = 380;
			
			// off buttons -------------------------------
			b1off = new Button(Assets.ta.getTexture("b1Off"));
			b1off.pivotX = b1off.width * .5;
			b1off.x = 50;
			b1off.y = 380;
			play.addChild(b1off);
			
			b2off = new Button(Assets.ta.getTexture("b2Off"));
			b2off.pivotX = b2off.width * .5;
			b2off.x = 50;
			b2off.y = 0;
			play.addChild(b2off);
			
			b3off = new Button(Assets.ta.getTexture("b3Off"));
			b3off.pivotX = b3off.width * .5;
			b3off.x = 750;
			b3off.y = 0;
			play.addChild(b3off);
			
			b4off = new Button(Assets.ta.getTexture("b4Off"));
			b4off.pivotX = b4off.width * .5;
			b4off.x = 750;
			b4off.y = 380;
			play.addChild(b4off);
			
			b1.addEventListener(TouchEvent.TOUCH, on1);
			b2.addEventListener(TouchEvent.TOUCH, on2);
			b3.addEventListener(TouchEvent.TOUCH, on3);
			b4.addEventListener(TouchEvent.TOUCH, on4);
			b1off.addEventListener(TouchEvent.TOUCH, off1);
			b2off.addEventListener(TouchEvent.TOUCH, off2);
			b3off.addEventListener(TouchEvent.TOUCH, off3);
			b4off.addEventListener(TouchEvent.TOUCH, off4);
		}
		
		private function on1(event:Event):void{
			action(2);
		}
		private function on2(event:Event):void{
			action(1);
		}
		private function on3(event:Event):void{
			action(3);
		}
		private function on4(event:Event):void{
			action(4);
		}
		private function off1(event:Event):void{
			action(5);
		}
		private function off2(event:Event):void{
			action(5);
		}
		private function off3(event:Event):void{
			action(5);
		}
		private function off4(event:Event):void{
			action(5);
		}
		
		private function action(i:int):void{
			if(play.robotManager.bot.alive == true){
				switch(i){
					case 1:
						hit(play.monsterManager.mon1, i);
						break;
					case 2:
						hit(play.monsterManager.mon2, i);
						break;
					case 3:
						hit(play.monsterManager.mon3, i);
						break;
					case 4:
						hit(play.monsterManager.mon4, i);
						break;
					case 5:
						if(play.wait == false){
							play.wait = true;
							if(play.game.mute == false)
								Assets.miss.play();
							play.robotManager.spawn(6);
							setTimeout(recover,500);
							play.score.minusScore(200);
						}	
						break;
				}
			}
		}
		
		private function hit(mon:Monster, i:int):void{
			if(mon.alive == true && play.wait == false){
				play.kills +=1;
				play.wait = true;
				if(play.game.mute == false)
					Assets.explosion.play();
				play.particleManager.spawn(mon.x, mon.y);
				play.monsterManager.destroyMonster(mon);
				play.score.addScore(400);
			
				play.robotManager.spawn(i+1);
				setTimeout(recover,500);
			}
		}
		
		private function recover():void{
			play.robotManager.recover();
			play.wait = false;
		}
		
		public function update():void{
			var a:Button;
			var c:Button;
			var mon:Monster;
			
			switch(play.monsterManager.current){
				case 1: a = b2; c = b2off; mon = play.monsterManager.mon1; switchButton(mon,a,c); break;
				case 2: a = b1; c = b1off; mon = play.monsterManager.mon2; switchButton(mon,a,c); break;
				case 3: a = b3; c = b3off; mon = play.monsterManager.mon3; switchButton(mon,a,c); break;
				case 4: a = b4; c = b4off; mon = play.monsterManager.mon4; switchButton(mon,a,c); break;
			}
		}
		
		private function switchButton(mon:Monster,a:Button,c:Button):void{
			if(mon.alive == true){
				play.removeChild(c);
				play.addChild(a);
			}
			else{
				play.removeChild(a);
				play.addChild(c);
			}
		}
		
		public function destroy():void{
			b1.removeFromParent(true);
			b1 = null;
			b2.removeFromParent(true);
			b2 = null;
			b3.removeFromParent(true);
			b3 = null;
			b4.removeFromParent(true);
			b4 = null;
		}
	}
}