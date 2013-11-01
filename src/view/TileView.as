package view
{
	import common.AssetWarehouse;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import model.LevelFactory;
	import model.LevelModel;
	import model.MainModel;
	import model.TileModel;

	public class TileView extends Sprite
	{
		private var tileUp_mc:MovieClip;
		private var tileDown_mc:MovieClip;
		private var tileModel:TileModel;
		
		public function TileView(tileModel:TileModel)
		{
			this.tileModel = tileModel;
			this.tileDown_mc = AssetWarehouse.getInstance().getSkinAsset("tile_down") as MovieClip;
			this.tileUp_mc = AssetWarehouse.getInstance().getSkinAsset("tile_up") as MovieClip;
			addChild(tileDown_mc);
			addChild(tileUp_mc);
			
			this.tileDown_mc.y = MainModel.STAGE_HEIGHT - tileModel.pos.y;
			this.tileUp_mc.y = tileDown_mc.y - tileModel.gapHeight;
		}
		
		public function update():void
		{
			this.x = tileModel.pos.x;
		}
		
		public function checkBeeCollision(bee:DisplayObject):Boolean
		{
			return (tileUp_mc.hitTestPoint(bee.x, bee.y) || tileDown_mc.hitTestPoint(bee.x, bee.y));
		}
	}
}