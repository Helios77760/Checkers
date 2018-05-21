package logic {
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.filters.BevelFilter;

	import utils.GraphicPos;
	import utils.GValue;

	public class Board extends Sprite{

		private var _board:Vector.<Pawn>;
		private var _tiles:Vector.<Shape>;

		public function Board() {
			_board = new Vector.<Pawn>(51);
			_tiles = new Vector.<Shape>(100);
			var i:int;
			for(i=0; i<100;i++) //Tile initialisation
			{
				_tiles[i] = new Shape();
				drawTile(_tiles[i], i);
				addChild(_tiles[i]);
			}
			for(i=1; i<=50;i++) //Pawn initialisation
			{
				if(i <= 20) //Black pieces
				{
					_board[i]=new Pawn(i,false, false);
					drawPawn(_board[i]);
					addChild(_board[i]);
				}

				if(i > 30) //White pieces
				{
					_board[i]=new Pawn(i,true, false);
					drawPawn(_board[i]);
					addChild(_board[i]);
				}
			}
		}

		private static function drawPawn(p:Pawn):void {
			if(p != null)
			{
				p.graphics.clear();
				p.graphics.beginFill(p.white ? GValue.WHITE_PAWN_COLOR : GValue.BLACK_PAWN_COLOR);
				var gp:GraphicPos = GraphicPos.getGraphicalPos(p.pos);
				p.graphics.drawEllipse(gp.x+GValue.PAWN_OFFSET, gp.y+GValue.PAWN_OFFSET, GValue.PAWN_SIZE, GValue.PAWN_SIZE);
				var bevel:BevelFilter = new BevelFilter(5);
				p.filters=new Array(bevel);
				p.graphics.endFill();
			}
		}

		private static function drawQueen(p:Pawn):void {
			if(p != null)
			{
				p.graphics.clear();
				p.graphics.lineStyle(GValue.QUEEN_STROKE, GValue.QUEEN_STROKE_COLOR, 1.0,true);
				p.graphics.beginFill(p.white ? GValue.WHITE_PAWN_COLOR : GValue.BLACK_PAWN_COLOR);
				var gp:GraphicPos = GraphicPos.getGraphicalPos(p.pos);
				p.graphics.drawEllipse(gp.x+GValue.QUEEN_OFFSET, gp.y+GValue.QUEEN_OFFSET, GValue.QUEEN_SIZE, GValue.QUEEN_SIZE);
				var bevel:BevelFilter = new BevelFilter(5);
				p.filters=new Array(bevel);
				p.graphics.endFill();
			}
		}

		private static function drawTile(t:Shape, i:int):void
		{
			if(t != null)
			{
				var row:int = i/10;
				t.graphics.beginFill(((i%2==0) == (row%2==0)) ? GValue.WHITE_TILE_COLOR : GValue.BLACK_TILE_COLOR);
				t.graphics.drawRect((i%10)*GValue.TILE_SIZE, row*GValue.TILE_SIZE, GValue.TILE_SIZE, GValue.TILE_SIZE);
				t.graphics.endFill();
			}
		}

		public function promote(pos:int):void
		{
			if(pos > 0 && pos <= 50 && _board[pos] != null &&!_board[pos].isQueen)
			{
				_board[pos].isQueen=true;
				drawQueen(_board[pos]);
			}
		}
	}
}
