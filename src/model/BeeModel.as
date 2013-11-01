package model
{
	import flash.geom.Point;
	
	public class BeeModel
	{
		private static const ACCELERATION:Number = 0.7;
		private static const INITIAL_ACCELERATION:Number = 2;
		private var down_acceleration:Number;
		public var pos:Point;
		private var dead:Boolean;
		
		public function BeeModel()
		{
			init();
		}
		
		public function init():void
		{
			this.pos = new Point(MainModel.STAGE_WIDTH-75, 60);
			this.down_acceleration = INITIAL_ACCELERATION;
			this.dead = false;
		}
		
		public function boost():void
		{
			down_acceleration -= ACCELERATION;
			pos.y += down_acceleration;
			checkPosition();
		}

		public function drop():void
		{
			down_acceleration += ACCELERATION;
			pos.y += down_acceleration;
			checkPosition();
		}
		
		public function moveLeft():void
		{
			pos.x -= 1;
			checkPosition();
		}
		
		public function moveRight():void
		{
			pos.x += 1;
			checkPosition();
		}
		
		public function die():void
		{
			dead = true;
		}
		
		public function isDead():Boolean
		{
			return dead;
		}
		
		private function checkPosition():void
		{
			if (pos.y > MainModel.STAGE_HEIGHT || pos.y < 0)
				this.die();
		}
	}
}