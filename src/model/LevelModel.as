package model
{
	public class LevelModel
	{
		public var cameraXPos:Number; // camera x position (in screen pixels)
		public var currentTile:uint; // represent the index in the LevelFactory arr of the last tile
									//that was “discovered” be the camera.
		public var cameraSpeed:uint
		public static const CAMERA_SPEED:Number = 5;
			
		public function LevelModel()
		{
			init();
		}
		
		public function init():void
		{
			cameraXPos = 0;
			currentTile = 0;
			cameraSpeed = CAMERA_SPEED;
		}
		
		//checks to see if the camera has moved enough to show another groupd part
		private function isNextTileVisible():Boolean
		{
			// IMPORTANT: the camera is moving in screen pixels and the currentTile from the
			//LevelFactory is represented in grid position.
			return (!isLevelFinished() && (cameraXPos >= (currentTile * TileModel.TILE_SIZE)));
		}
		
		public function getCurrentTile():TileModel
		{
			return LevelFactory.getInstance().tiles[currentTile];
		}
		
		public function advanceTile():void{
			if (!isLevelFinished())
				currentTile++;
		}
		
		public function isLevelFinished():Boolean{
			return LevelFactory.getInstance().size()-1 == currentTile;
		}
		
		public function advanceCamera():void {
			this.cameraXPos += cameraSpeed; // add CAMERA_SPEED pixels to the position of the camera
			if (isNextTileVisible()){
				advanceTile();
			}
		}
		
		public function speedCam():void {
			cameraSpeed++;
		}
		
		public function slowCam():void {
			cameraSpeed--;
		}
	}
}