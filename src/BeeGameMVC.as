package
{
	import flash.display.Sprite;
	import common.AssetWarehouse;
	
	import controller.MainController;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import model.MainModel;
	
	[SWF(width="550", height="400", frameRate="24", backgroundColor="#333333")]
	public class BeeGameMVC extends Sprite
	{
		private var mainController:MainController;
		
		public function BeeGameMVC()
		{
			AssetWarehouse.getInstance().addEventListener(Event.INIT, init);
		}
		
		private function init(event:Event):void 
		{ 
			var mainModel:MainModel = new MainModel();
			this.mainController = new MainController(this.stage, mainModel); 	
		}
	}
}