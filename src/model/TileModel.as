package model
{
	import flash.geom.Point;

	public class TileModel
	{
		public var pos:Point;
		public var gapHeight:uint;
		public static const TILE_SIZE:uint = 40; 
		
		public function TileModel(inPos:Point, gapHeight:uint)
		{
			this.pos = new Point();
			this.pos.x = -inPos.x * TILE_SIZE;
			this.pos.y = inPos.y * TILE_SIZE;
			this.gapHeight = gapHeight * TILE_SIZE;
		}
	}
}