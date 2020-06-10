import React from 'react'
import Tile from './tile';

export default class Board extends React.Component {
    constructor(props){
        super(props);

    }

    render(){
        return(
            <div className="board">
                {this.props.board.grid.map( (row, idx) => {
                    return(
                        <div key={idx} className={`row`}>
                            {this.renderRow.bind(this)(row)}
                        </div>
                    )})}
            </div>
        );
    };

    renderRow(row) {
        
        row = row.map( (tile, j) => {
            return (
                <Tile key={j} object={tile} updateGame={this.props.updateGame}/>
            )
        });
        // debugger
        return row;
    }
}