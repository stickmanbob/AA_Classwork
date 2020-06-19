import { RECEIVE_ALL_POKEMON, RECEIVE_A_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer = function(state = {}, action) {
    switch(action.type){
        case RECEIVE_ALL_POKEMON:
            return action.pokemon 
        case RECEIVE_A_POKEMON:
            let newstate = Object.assign({},state)
            newstate[action.pokemon.id] = action.pokemon;
            return newstate;
        default:
            return state;
    }
}

export default pokemonReducer;