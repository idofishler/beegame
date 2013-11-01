package view
{
	import common.AssetWarehouse;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.sampler.NewObjectSample;
	
	import model.MainModel;
	import model.ScoreModel;
	
	public class MainView extends Sprite
	{
		private var beeView:BeeView;
		private var cloudView:CloudsRender;
		private var levelView:LevelView;
		private var mainModel:MainModel;
		public var menuView:MenuView;
		private var scoreView:ScoreView;
		
		private var background:Sprite;
		
		public function MainView(mainModel:MainModel)
		{
			this.mainModel = mainModel;
			
			//BACKGROUND
			this.addChild(AssetWarehouse.getInstance().getSkinAsset("sky_background") as MovieClip);
			
			//ADD CLOUDs
			this.cloudView = new CloudsRender();
			this.addChild(cloudView);
			
			
			//ADD MENU
			this.menuView = new MenuView(this.mainModel.scoreModel);
			this.addChild(menuView);
			
			init();
		}
		
		public function init():void
		{
			
			if (levelView != null)
				removeChild(levelView);
			
			if (beeView != null)
				removeChild(beeView);
			
			if (scoreView != null)
				removeChild(scoreView);
			
			this.menuView.hide();
			
			//ADD LEVEL
			this.levelView = new LevelView(this.mainModel.levelModel);
			this.addChild(levelView);
			
			//ADD SCORE
			this.scoreView = new ScoreView(this.mainModel.scoreModel);
			this.addChild(scoreView);
			
			//ADD BEE
			this.beeView = new BeeView(this.mainModel.beeModel);
			this.addChild(beeView);
			
			this.swapChildren(this.levelView, this.menuView);
		}
		
		public function update():void 
		{
			var gameIsRunning:Boolean = !mainModel.isGameOver();
			
			if (gameIsRunning)
			{
				this.levelView.update();
				this.scoreView.update();
			} else
			{
				menuView.show();
			}
			this.beeView.update();
			this.cloudView.update();
		}
		
		public function checkBeeCollision():Boolean
		{
			return levelView.checkBeeCollision(beeView);
		}
	}
}