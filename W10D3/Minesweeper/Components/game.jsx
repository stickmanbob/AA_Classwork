import React from 'react'
import * as Minesweeper from './minesweeper'
import Board from './board'

export default class Game extends React.Component{
    constructor(){
        super();
        let board = new Minesweeper.Board(9, 9);
        this.state = {board:board};
        this.updateGame = this.updateGame.bind(this);
        this.restart = this.restart.bind(this);
    }

    updateGame(tile, flag){ //flag is a boolean (true with alt)
       
        if (flag) {
            tile.toggleFlag();
        } else {
            tile.explore();
        }
        this.setState({board: this.state.board});
    }

    restart() {
        let newBoard = new Minesweeper.Board(9, 9);
        this.setState({ board: newBoard });
    }

    render(){
        if (this.state.board.won()){
        
            return(
            <div>
                <div className = "screen"></div>
                <div className= 'popup'> 
                    <p>You Won!</p>
                    <button onClick = {this.restart}>Restart Game</button>
                    
                </div>
                <Board board={this.state.board} updateGame={this.updateGame} />
            </div> 
            )
        } else if (this.state.board.lost()) {
            return(
            <div>
                <div className="screen"></div>
                <div class="popup">
                <p>You Lost!</p>
                <button onClick={this.restart}>Restart Game</button>

                </div>
                <Board board={this.state.board} updateGame={this.updateGame} />
            </div>
            )
        } else {

        return (
        <div>
            <Board board={this.state.board} updateGame={this.updateGame} />
        </div>
        )}
    }
}