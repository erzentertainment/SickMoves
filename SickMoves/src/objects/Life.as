package objects
{
	import starling.display.Shape;
	import starling.display.Sprite;
		
	public class Life extends Sprite
	{
		private var shape:Shape;
		private var shape2:Shape;
		public var life:int;
		
		public function Life(life:int)
		{
			this.life = life;
			shape = new Shape();
			shape2 = new Shape();
			addChild(shape);
			addChild(shape2);
			
			shape2.graphics.clear();
			shape2.graphics.lineStyle(5, 0xFFFFFF);
			shape2.graphics.drawRect(0, -12, life, 25);
			
			shape.graphics.clear();
			shape.graphics.beginFill(0xFF0000);
			shape.graphics.lineStyle(20, 0xFF0000);
			shape.graphics.moveTo(0, 0);
			shape.graphics.lineTo(life, 0);
		}
		
		public function update(l:int):void{
			life += l;
			if(life > 300)
				life = 300;
			else if(life < 0)
				life = 0;
			shape.graphics.clear();
			shape.graphics.lineStyle(20, 0xFF0000);
			shape.graphics.moveTo(0, 0);
			shape.graphics.lineTo(life, 0);
		}
		
		public function destroy():void{
			shape.removeFromParent(true);
			shape2.removeFromParent(true);
			shape = null;
			shape2 = null;
		}
	}
}