let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = new Array(8).fill().map(()=>new Array(8).fill()); //why does curly don't work
  grid[3][4] = new Piece('black');
  grid[4][3] = new Piece('black');
  grid[3][3] = new Piece('white');
  grid[4][4] = new Piece('white');
  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let valid = true;
  pos.forEach(function (el) {
    if(el < 0 || el > 7){
      valid = false;
    } 
  });
  return valid;
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (!this.isValidPos(pos)){
    throw new Error('Not valid pos!');
  }
  return this.grid[pos[0]][pos[1]];
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let piece = this.getPiece(pos);
  if ( piece ){
      return piece.color === color;
  }else{
    return false;
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  let piece = this.getPiece(pos);
  return !!piece;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip){
 
  let nextPos = [pos[0] + dir[0], pos[1]+dir[1]];
  if (!this.isValidPos(nextPos) || !this.isOccupied(nextPos)){
    return [];
  }
  piecesToFlip = piecesToFlip || []
  if (this.isMine(nextPos, color)){
    return piecesToFlip;
  }else{
    piecesToFlip.push(nextPos);
    return this._positionsToFlip(nextPos,color,dir,piecesToFlip);
  }
  
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  let valid = false;
  let board = this;
  Board.DIRS.forEach(function (dir) {
    if (board._positionsToFlip(pos, color, dir).length > 0){
      valid = true;
    }
  });
  return valid;
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)){
    throw new Error('Invalid Move');
  }
  this.grid[pos[0]][pos[1]] = new Piece(color);
  let positions = [];
  let direction;
  let board = this;
  Board.DIRS.forEach(function (dir) {
    direction = board._positionsToFlip(pos, color, dir);
    if (direction.length > 0) {
      positions = positions.concat(direction);
    }
  });
  
  for(let i = 0; i < positions.length; i++){
    this.getPiece(positions[i]).flip();
  }
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let valid = [];
  for(let i = 0; i < this.grid.length;i++ ){
    for(let j = 0; j < this.grid[0].length; j++){
      if (this.validMove([i,j],color)){
        valid.push([i,j]);
      }
    }
  }
  return valid;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  for(let i = 0; i < this.grid.length;i++ ){
    for(let j = 0; j < this.grid[0].length; j++){
      if (this.validMove([i,j],color)){
        return true;
      }
    }
  }
  return false;
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return (!this.hasMove('white') && !this.hasMove('black') )
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  // let board = [];
  console.log('  0 1 2 3 4 5 6 7')
  for(let i = 0; i < this.grid.length;i++ ){
    let row = `${i} `;
    for(let j = 0; j < this.grid[0].length; j++){
        if (this.grid[i][j] === undefined) {
          row = row.concat("- ");
        } else{
          row += this.grid[i][j].toString() + " ";
        }
    }
    console.log(row);
  }
  // board;
};




module.exports = Board;
