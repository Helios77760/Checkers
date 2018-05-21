package utils {
	public class GraphicPos {
		private var _x:uint;
		private var _y:uint;
		public function GraphicPos(x:uint, y:uint) {
			_x=x;
			_y=y;
		}

		public function get x():uint {
			return _x;
		}

		public function set x(value:uint):void {
			_x = value;
		}

		public function get y():uint {
			return _y;
		}

		public function set y(value:uint):void {
			_y = value;
		}

		public static function getGraphicalPos(pos:int):GraphicPos
		{
			return new GraphicPos(column(pos)*GValue.TILE_SIZE, row(pos)*GValue.TILE_SIZE)
		}

		private static function row(pos:int):uint
		{
			return (uint)((pos-1)/5);
		}

		private static function column(pos:int):uint
		{
			var raw:int = ((pos-1)%5)*2;
			var bias:int = (((pos-1)/5)+1)%2;
			return raw+bias;
		}
	}
}
