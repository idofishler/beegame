package view
{
	import flash.display.Sprite;

	public class CloudsRender extends Sprite
	{
		public static var GAP:uint = 10;
		private static var LEVEL_SPAN:uint = 550;
		private static var NUM_OF_LEVELS:uint = 4;
		private static var INIT_CLOUD_SIZE:uint = 35;
		private static var CLOUD_Y_POS:uint = 15;
		private static var SPEED_RATIO:uint = 2;
		
		private var WHITE_LEVEL_1:int = 0xFFFFFF; 
		private var WHITE_LEVEL_2:int = 0xC4E6FE;
		private var WHITE_LEVEL_3:int = 0x5CC9FF;
		private var WHITE_LEVEL_4:int = 0x2FBCFC;
		private var colors:Array = new Array(WHITE_LEVEL_4, WHITE_LEVEL_3, WHITE_LEVEL_2, WHITE_LEVEL_1);
		
		private var clouds:Array;
		
		public function CloudsRender()
		{
			this.clouds = new Array();
			//creating cloud levels from level cloud view
			for (var i:int = 1; i <= NUM_OF_LEVELS; i++)
			{
				var cloudCount:uint = LEVEL_SPAN / (i * (INIT_CLOUD_SIZE + GAP));
				var cloudSize:uint = i * INIT_CLOUD_SIZE;
				clouds[i] = new LevelCloudView(i / SPEED_RATIO, colors[i-1], cloudCount, cloudSize, LEVEL_SPAN);
				clouds[i].y = (9 - i * 2) * CLOUD_Y_POS;
				this.addChild(clouds[i]);
			}
		}
		public function update():void{
			for (var i:int = 1; i <= NUM_OF_LEVELS; i++)
			{
				(clouds[i] as LevelCloudView).update();
			} 
		}
	}
}