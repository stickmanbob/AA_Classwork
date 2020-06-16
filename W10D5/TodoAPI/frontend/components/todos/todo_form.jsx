import React from 'react';
// import * as actions from '../../actions/todo_actions';
import * as utils from '../../utils/utils';
export default class Form extends React.Component{

    constructor(props){
        super(props);
        this.state = {};
        this.updateTitle = this.updateTitle.bind(this); 
        this.updateBody = this.updateBody.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);

    };

    updateTitle(e){
        this.setState({title:e.currentTarget.value})
    }

    handleSubmit(e){
        
        e.preventDefault();
        this.props.receiveTodo({title: this.state.title, body: this.state.body, id:utils.uniqueId()});
    };

    updateBody(e){
        // console.log(e);
        // console.log(e.currentTarget.value); 
        this.setState({body: e.currentTarget.value})
    }

    render(){
        return(
            <form onSubmit={this.handleSubmit}>
                <label htmlFor=""> Title 
                    <input onChange={this.updateTitle} type="text" value = {this.state.title} />
                </label>

                <label htmlFor="">Body 
                    <textarea name="" id="" cols="30" rows="10" onChange={this.updateBody}>{this.state.body}</textarea>
                </label>

                <input  type="submit" value="Create Todo"/>

            </form>
        )
    }


}