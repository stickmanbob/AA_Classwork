import ReactDOM from "react-dom";
import configureStore from "./store/store";
import Root from "./components/root";
import React from 'react'

document.addEventListener("DOMContentLoaded", () => {
    let store;

    if(window.currentUser){
        const preloadedState = {
            entities: {
                users: {
                    [window.currentUser.id]: window.currentUser
                }
            },
            session: {
                currentUser: window.currentUser.id 
            }

        };

        store = configureStore(preloadedState);
        delete window.currentUser; 
    } else{
        store = configureStore();
    }
    

    // TESTING START
    window.getState = store.getState;
    window.dispatch = store.dispatch;
    // TESTING END

    const root = document.getElementById("root");
    ReactDOM.render(<Root store={store} />, root);
})

import {login, signup, logout} from './actions/session_actions';
import { fetchBenches } from './actions/bench_actions';
window.login = login; 
window.logout = logout; 
window.signup = signup; 

window.fetchBenches = fetchBenches;