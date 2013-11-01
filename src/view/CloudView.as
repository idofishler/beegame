package view
{
	import flash.display.Sprite;
	
	import flashx.textLayout.formats.Float;
	
	public class CloudView extends Sprite
	{
		private static var CIRCLE_RATIO:uint = 8;
		private static var CLOUD_RATIO:uint = 2;
		
		private static var NUM_OF_CIRCLES:uint = 65;
		
		private var maxWidth:uint;
		private var maxHeight:uint;
		private var sizeOfCircle:uint;
		private var cloudColor:uint;
		
		//private var numOfCircles:uint;
		
		public function CloudView(maxWidth:uint, maxHeight:uint, cloudColor:uint)
		{
			this.maxWidth = maxWidth;
			this.maxHeight = maxHeight / CLOUD_RATIO;
			this.sizeOfCircle = maxWidth / CIRCLE_RATIO;
			this.cloudColor = cloudColor;
			
			makeCloud();
		}
		
		
		private function makeCloud():void 
		{
			var randomXPosition:Number;
			var randomYPosition:Number;
			var random:Number;
			
			for (var i:int ; i < NUM_OF_CIRCLES; i++)
			{
				random = Math.random();
				graphics.beginFill(cloudColor);
				randomXPosition = (random * maxWidth);
				random = Math.random();
				randomYPosition = (random * maxHeight);
				graphics.drawCircle(randomXPosition, randomYPosition, sizeOfCircle);
				graphics.endFill();
			}
		}
	}
}