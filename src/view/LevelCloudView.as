package view
{
	import flash.display.Sprite;
	
	//import mx.core.UIComponentDescriptor;
	
	public class LevelCloudView extends Sprite
	{
		private static var CLOUD_DENSITY:uint = 20;
		private static var OFFSET:uint = 50;
		private static var CLOUD_Y_MOVEMENT:Number = 0.3;

		private var clouds:Array = new Array();
		private var speed:Number;
		private var cloudScale:Number;
		private var cloudCount:uint;
		private var cloudColor:uint;
		private var levelSpan:uint;
		
		public function LevelCloudView(speed:Number, cloudColor:uint, cloudCount:uint, cloudScale:Number, levelSpan:uint)
		{
			this.speed = speed;
			this.cloudScale = cloudScale;
			this.cloudCount = cloudCount;
			this.cloudColor = cloudColor;
			this.levelSpan = levelSpan;
			
			makeClouds();
		}
		
		public function update():void{
			for (var i:uint; i< cloudCount; i++)
			{
				if (clouds[i].x > levelSpan + cloudScale)
				{
					clouds[i].x = -cloudScale - OFFSET;
					clouds[i].y = 0;
				}
				clouds[i].x += speed;
				var randomMove:Number = Math.random();
				if (randomMove > 0.5)
					clouds[i].y += CLOUD_Y_MOVEMENT;
				else
					clouds[i].y -= CLOUD_Y_MOVEMENT;
			}
		}
		
		private function makeClouds():void{
			for (var i:uint = 0; i < cloudCount; i++)
			{
				clouds[i] = new CloudView(cloudScale, cloudScale, cloudColor);
				var gap:uint = (cloudScale * CloudsRender.GAP / CLOUD_DENSITY);
				clouds[i].x = (cloudScale + gap) * i; 
				addChild(clouds[i]);
			}
		}
	}
}