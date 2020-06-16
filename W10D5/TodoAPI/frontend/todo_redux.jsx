import App from "./components/app"
import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from "./store/store";
import * as actions from "./actions/todo_actions"
import Root from "./components/root";

const store = configureStore();
window.store = store; //test

document.addEventListener("DOMContentLoaded",()=>{
    ReactDOM.render( < Root store={store}/>, document.getElementById("root") );
})
