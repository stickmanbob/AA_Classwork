import React from 'react';
import {Link} from 'react-router-dom'



class Greeting extends React.Component{

    constructor (props){
        super(props);
        this.handleLogout = this.handleLogout.bind(this);
    }

    handleLogout(e) {
        // debugger 
        e.preventDefault();

        this.props.logout();
    }

    render(){
        if (this.props.currentUser){
            return (
            <>
                <h1>Welcome, {this.props.currentUser.username}</h1>
                <button onClick={this.handleLogout}> LogOut </button>
            </>
            )
        } else {
            return (
                <>
                    <Link to="/signup">Sign Up</Link>
                    <Link to="/login">Log In</Link> 
                </>
            )
        }
    }
};

export default Greeting;