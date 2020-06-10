import React from 'react';

export default class Tile extends React.Component {
    constructor(props) {
        super(props);
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e) { 
        this.props.updateGame(this.props.object, e.altKey);
    }

    render(){
        let glyph
        let tileclass
        if (!this.props.object.explored) {
            if(this.props.object.flagged){
                glyph = "F";
                tileclass = "flagged";
            }else{
                glyph = " ";
                tileclass = "unexplored";
            }
        } else {
            
            if (this.props.object.bombed) {
                glyph = "B";
                tileclass = "bombed";
            } else {
                glyph = this.props.object.adjacentBombCount();
                tileclass = "revealed";
            }
            
        }

        return(
            <div className={`tile ${tileclass}`} onClick={this.handleClick}>
                {glyph}
            </div>
        )
    }
}