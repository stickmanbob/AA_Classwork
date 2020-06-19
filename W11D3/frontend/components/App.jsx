import React from 'react';
import GreetingContainer from './greeting/greeting_container'
import {Route, Switch,Redirect, BrowserRouter as Router} from "react-router-dom"; 
import {LoginFormContainer} from './session_forms/LoginFormContainer';
import { SignupFormContainer } from './session_forms/SignupFormContainer';
import {AuthRoute} from '../util/route_util';
const App = () => (
    <div>
        <header>
            <h1>Bench BnB</h1>
            <GreetingContainer />
        </header>
    
              <AuthRoute path="/login" exact component={LoginFormContainer}/>
            
        
             <AuthRoute path="/signup" exact component={SignupFormContainer} />
        
       
        
    </div>
);

export default App;