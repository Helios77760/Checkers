package logic {
	import flash.display.Shape;

	public class Pawn extends Shape{
		private var _white:Boolean;
		private var _isQueen:Boolean;
		private var _pos:int;

		public function Pawn(position:int,white:Boolean, isQueen:Boolean) {
			super();
			_white = white;
			_isQueen = isQueen;
			if(position < 1)
					_pos=1;
			else if(position > 50)
					_pos=50;
			else
					_pos=position;
		}

		public function get white():Boolean {
			return _white;
		}

		public function get isQueen():Boolean {
			return _isQueen;
		}

		public function set isQueen(value:Boolean):void {
			_isQueen = value;
		}

		public function set white(value:Boolean):void {
			_white = value;
		}

		public function get pos():int {
			return _pos;
		}

		public function set pos(value:int):void {
			if(value < 1)
				_pos=1;
			else if(value > 50)
				_pos=50;
			else
				_pos=value;
		}
	}

}
