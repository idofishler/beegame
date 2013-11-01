package view
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	import model.LevelFactory;
	import model.LevelModel;
	import model.MainModel;
	import model.TileModel;
	
	//import mx.core.UIComponentDescriptor;
	
	public class LevelView extends Sprite {
		
		private var m_levelModel:LevelModel;
		private var lastTileAdded:TileModel;
		private var lastTileView:TileView;
		private var shownTiles:Array;
		
		public function LevelView(levelModel:LevelModel)
		{
			this.shownTiles = new Array();
			this.m_levelModel = levelModel;
			this.lastTileAdded = null;
			this.lastTileView = null;
		}
		
		public function update():void
		{
			//check if the current tile (form the model) needs to be shown 
			var curTileModel:TileModel = m_levelModel.getCurrentTile();
			if (lastTileAdded != curTileModel)
			{
				var nextTileToShow:TileView = new TileView(curTileModel);
				shownTiles.push(nextTileToShow);
				this.addChild(nextTileToShow);
				
				// Update the last tile after it has been added
				lastTileAdded = curTileModel;
				lastTileView = nextTileToShow;
			}	
			advanceTiles();
		}
		
		private function advanceTiles():void 
		{
			for (var i:uint = 0; i < shownTiles.length; i++)
			{
				if (shownTiles[i] != null)
				{
					shownTiles[i].update()
					shownTiles[i].x += m_levelModel.cameraXPos;
					
					// Check if tile is out of the stage and remove it
					if (shownTiles[i].x > MainModel.STAGE_WIDTH + TileModel.TILE_SIZE) 
					{
						removeChild(shownTiles[i]);
						shownTiles[i] = null;
					}
				}
			}
		}
		
		public function getLastTilePosition():uint {
			return lastTileView.x;
		}
		
		public function checkBeeCollision(bee:DisplayObject):Boolean {
			for (var i:uint = 0; i < shownTiles.length; i++)
			{
				if (shownTiles[i] != null) 
				{
					if (shownTiles[i].checkBeeCollision(bee))
						return true;
				}
			}
			return false;
		}
	}
}