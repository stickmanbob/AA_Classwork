import React from 'react'
import PokemonIndexItem from './pokemon_index_item'

export default class PokemonIndex extends React.Component {
    constructor(props) {
        super(props);
    
    }

    componentDidMount () {
        
        this.props.requestAllPokemon()
    }

    render(){
        // debugger
        const pokemonItems = this.props.pokemon.map(poke => (
            <PokemonIndexItem key={poke.id} pokemon={poke} />
        ));
        return (
            <section className="pokedex"> 
                <ul>{pokemonItems}</ul>
            </section>
        );
    }
}

//maybe fragment, why red error
