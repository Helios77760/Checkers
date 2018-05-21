package utils {
	import flash.errors.IllegalOperationError;

	public class GValue {

		public static const WINDOW_WIDTH:uint=800;
		public static const WINDOW_HEIGHT:uint=800;

		public static const TILE_SIZE:uint=(WINDOW_HEIGHT < WINDOW_WIDTH) ? WINDOW_HEIGHT/10: WINDOW_WIDTH/10;

		public static const WHITE_PAWN_COLOR:uint=0xCCCCCC;
		public static const BLACK_PAWN_COLOR:uint=0x333333;

		public static const WHITE_TILE_COLOR:uint=0xFFFFFF;
		public static const BLACK_TILE_COLOR:uint=0x000000;

		private static const PAWN_SIZE_RATIO:Number = 0.92;
		private static const QUEEN_STROKE_RATIO:Number = 0.08;
		public static const QUEEN_STROKE_COLOR:uint = 0xffd700;

		public static const PAWN_SIZE:int = TILE_SIZE*PAWN_SIZE_RATIO;
		public static const QUEEN_STROKE:int = TILE_SIZE*QUEEN_STROKE_RATIO;
		public static const QUEEN_SIZE:int = PAWN_SIZE-QUEEN_STROKE;

		public static const PAWN_OFFSET:int = ((1-PAWN_SIZE_RATIO)/2)*TILE_SIZE;
		public static const QUEEN_OFFSET:int = PAWN_OFFSET+QUEEN_STROKE/2;


		public function GValue() {
			throw new IllegalOperationError("GValue shouldn't be instanciated !");
		}
	}
}
