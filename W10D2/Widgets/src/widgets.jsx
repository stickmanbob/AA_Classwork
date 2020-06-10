import React from 'react';
import ReactDOM from 'react-dom'
import Clock from './clock'
import Tab from './tabs'
import Weather from "./weather"
const Root = () => {
    return (
        <div>
            <h1>Root is here!</h1>
            <Clock />
            <Tab tabs={[{ title: "tab1", content: "I'm a tab!" }, { title: "tab2", content: "I'm also a tab!" }]}/>
            <Weather />
        </div>
    )
}

document.addEventListener("DOMContentLoaded", ()=> {
    let main = document.getElementById("main");

    ReactDOM.render(<Root />, main); 
});