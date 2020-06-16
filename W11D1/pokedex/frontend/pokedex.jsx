import React from 'react'
import ReactDOM from 'react-dom'
import { RECEIVE_ALL_POKEMON } from './actions/pokemon_actions'

document.addEventListener('DOMContentLoaded', () => {
    const rootEl = document.getElementById('root');
    ReactDOM.render(<h1>Pokedex</h1>, rootEl);
});