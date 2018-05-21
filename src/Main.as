package
{
	import flash.display.Sprite;
	import flash.events.Event;

	import logic.Board;

	[SWF(width="800",height="800",backgroundColor="#ffffff")]
	public class Main extends Sprite {

		private var board:Board;

		public function Main():void {
			board = new Board();
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point

			addChild(board);
		}
	}
}
