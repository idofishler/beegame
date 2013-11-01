package view
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import common.AssetWarehouse;
	import model.MainModel;
	import model.ScoreModel;
	
	public class ScoreView extends Sprite
	{
		private var score_mc:MovieClip;
		private var scoreModel:ScoreModel;
		public function ScoreView(scoreModel:ScoreModel)
		{
			this.scoreModel = scoreModel;
			score_mc = AssetWarehouse.getInstance().getSkinAsset("show_score",false) as MovieClip;
			this.addChild(score_mc);
			this.x = MainModel.STAGE_WIDTH;
			this.y = 0;
		}
		
		public function update():void
		{
			this.score_mc.score_text.text = scoreModel.score;
		}
	}
}