package view
{
	import common.AssetWarehouse;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import model.BeeModel;
	
	public class BeeView extends Sprite
	{
		public static const BEE_SCALE:Number = 0.5;
		public static const DEAD_BEE_DROP_SPEED:uint = 12;
		private var beeModel:BeeModel;
		
		
		public function BeeView(beeModel:BeeModel)
		{
			
			this.beeModel = beeModel;
			this.scaleX = BEE_SCALE;
			this.scaleY = BEE_SCALE;
			
			this.addChild(AssetWarehouse.getInstance().getSkinAsset("bee") as MovieClip);
			
			this.x = beeModel.pos.x;
			this.y = beeModel.pos.y;
		}
		
		public function update():void
		{
			if (beeModel.isDead()) {
				removeChildAt(0);
				this.addChild(AssetWarehouse.getInstance().getSkinAsset("dead_bee") as MovieClip);
				this.y += DEAD_BEE_DROP_SPEED;
			} else 	{
				this.x = beeModel.pos.x;
				this.y = beeModel.pos.y;			
			}
		}
		
		
	}
}