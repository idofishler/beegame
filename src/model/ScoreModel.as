package model
{
	import flash.net.SharedObject;
	
	public class ScoreModel
	{
		public var score:int;
		public var isNewHighScore:Boolean;
		private var highestScoreObject:SharedObject =  SharedObject.getLocal("beeGame_highest_score");
		
		public function ScoreModel()
		{
			init();
			if (highestScoreObject.data.highScore == null) 
				highestScoreObject.data.highScore = 0;
		}
		
		public function init():void
		{
			isNewHighScore = false;
			this.score = -1;
			
		}
		
		public function update():void
		{
			this.score++;
		}
		
		public function get highestScore():int
		{
			return highestScoreObject.data.highScore;			
		}
		
		public function set highestScore(newScore:int):void 
		{
			highestScoreObject.data.highScore = newScore;
			isNewHighScore = true;
		}
	}
}