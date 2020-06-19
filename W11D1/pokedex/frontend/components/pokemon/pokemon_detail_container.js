import { connect } from 'react-redux'
import PokemonDetail from "pokemon_detail"
import {requestSinglePokemon} from "../../actions/pokemon_actions"

const mapStateToProps = (state, ownProps) => ({
    // piece of state that container subscribes to\
    // do we need to extract using ownProps here?
    //what exactly does ownProps pull?
    pokemon: state.entities.pokemon[ownProps.match.params.pokemonId]
})

const mapDispatchToProps = dispatch => ({ 
    requestSinglePokemon: ()=> dispatch(requestSinglePokemon())
});

// QUESTION whats going on ^

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(PokemonDetail);