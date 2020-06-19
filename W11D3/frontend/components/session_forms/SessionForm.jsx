import React from 'react';
import {Link} from 'react-router-dom';
export default class SessionForm extends React.Component {
    //...
    constructor(props) {
        super(props);
        this.state = {
            username: "",
            password: ""
        };
        this.handleInput = this.handleInput.bind(this);

        this.handleSubmit = this.handleSubmit.bind(this);

    }

    handleSubmit(e) {
        e.preventDefault();
        const user = Object.assign({}, this.state);
        this.props.processForm(user);
    }

    handleInput(property){
        let setter = function(event) {
            // debugger 
            this.setState({
                [property]: event.target.value
            })
            console.log(this.state) 
        }

        return setter.bind(this);
    }

    render () {
        var button;
        var header;
        var link;
        if (this.props.formType === "signup"){
            button = "Sign Up"
            header = <h1>Sign Up</h1>
            link = <Link to="/login"> Log in</Link>
        }else {
            button = "Log In"
            header = <h1>Log In</h1>
            link = <Link to="/signup"> Sign Up</Link>
        }
        return (
            
            <>
                {link}

                <form onSubmit={this.handleSubmit}>
                    {header}

                    <label> Username
                     <input type="text" value={this.state.username} onChange={this.handleInput("username")}/>
                    </label>

                    <label> Password
                        <input type="password" value={this.state.password} onChange={this.handleInput("password")} />
                    </label>

                    <input type="submit" value={this.props.formType} />
                </form>

                {this.props.errors.map((error)=>{
                    return <h2>{error}</h2>
                })}
            </>
        );
    }

    //...
}