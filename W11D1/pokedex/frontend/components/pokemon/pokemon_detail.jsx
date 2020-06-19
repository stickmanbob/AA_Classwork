import React from 'react'

class PokemonDetail extends React.Component{

    constructor(props){
        super(props);
    }

    componentDidMount(){
        this.props.requestSinglePokemon(this.props.match.params.pokemonId);
        //what does match do?
    }

    componentDidUpdate(prevProps){
        if (prevProps.match.params.pokemonId !== this.props.match.params.pokemonId){
            //define anything else?
            this.props.requestSinglePokemon(this.props.match.params.pokemonId)
        }
    }

    render() {
        <>
            <h1>{this.props.pokemon.name}</h1>
        </>
    }


}