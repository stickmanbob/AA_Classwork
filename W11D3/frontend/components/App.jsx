import React from 'react';
import GreetingContainer from './greeting/greeting_container'
import {Route, Switch,Redirect, HashRouter as Router} from "react-router-dom"; 
import {LoginFormContainer} from './session_forms/LoginFormContainer';
import { SignupFormContainer } from './session_forms/SignupFormContainer';
import {AuthRoute} from '../util/route_util';
import SearchContainer from "./benches/search_container"
const App = () => (
    <div>
        <header>
            <h1>Bench BnB</h1>
            <GreetingContainer />
        </header>
       
            <AuthRoute path="/login" exact component={LoginFormContainer}/>
            <AuthRoute path="/signup" exact component={SignupFormContainer}/>
            
             <Route exact path="/" component={SearchContainer} />
       
       
        
    </div>
);

export default App;