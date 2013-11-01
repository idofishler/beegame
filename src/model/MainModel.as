package model
{
	import flash.sampler.NewObjectSample;

	public class MainModel
	{
		public static const STAGE_WIDTH:uint = 550;
		public static const STAGE_HEIGHT:uint = 400;

		public var beeModel:BeeModel;
		public var levelModel:LevelModel;
		public var scoreModel:ScoreModel;
		private var gameOver:Boolean;
		
		public function MainModel()
		{
			this.beeModel = new BeeModel();
			this.levelModel = new LevelModel();
			this.scoreModel = new ScoreModel();
			this.gameOver = true;
		}
		
		public function init():void
		{	
			this.levelModel.init();
			this.scoreModel.init();
			this.beeModel.init();
			this.gameOver = false;
		}
		
		public function update():void
		{
			if (beeModel.isDead() || levelModel.isLevelFinished())
			{
				this.setGameOver();
				this.updateHighScore();
				return;
			}
			levelModel.advanceCamera();
			scoreModel.update();
		}
		
		public function setGameOver():void
		{
			this.gameOver = true;
		}
		
		public function updateHighScore():void
		{
			if (scoreModel.highestScore < scoreModel.score)
			{
				scoreModel.highestScore = scoreModel.score;
			}			
		}
		
		public function isGameOver():Boolean
		{
			return gameOver;
		}
	}
}