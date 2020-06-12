import App from "./frontend/components/app"
import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from "./frontend/store/store";
import * as actions from "./frontend/actions/todo_actions"
import Root from "./frontend/components/root";

const store = configureStore();
window.store = store; //test

document.addEventListener("DOMContentLoaded",()=>{
    ReactDOM.render( < Root store={store}/>, document.getElementById("root") );
})
