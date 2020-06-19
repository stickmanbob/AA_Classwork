import React from 'react'
import ReactDOM from 'react-dom'
import configureStore from './store/store.js'
import Root from "./components/root"



document.addEventListener('DOMContentLoaded', () => {
    const rootEl = document.getElementById('root');
    const store = configureStore();
    window.getState = store.getState;
    window.dispatch = store.dispatch; 
    ReactDOM.render(<Root store={store} />, rootEl);
});

///TESTING FUNCTIONS///////
///////////////////////////
import { selectAllPokemon } from './reducers/selectors'
import * as actions from './actions/pokemon_actions'
import * as util from "./util/api_util"
window.actions = actions;
window.util = util; 
window.selectAllPokemon = selectAllPokemon;

