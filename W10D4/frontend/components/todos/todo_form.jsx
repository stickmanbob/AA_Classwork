import react from 'react';

class Form{

    constructor(props){
        super(props);
        this.state = {};
        this.updateTitle = this.updateTitle.bind(this); 

    };

    updateTitle(e){
        this.setState({title:e.currentTarget.value})
    }

    render(){
        return(
            <form action="">
                <label htmlFor=""> Title 
                    <input onChange={this.updateTitle} type="text" value = {this.state.title} />
                </label>

                <label htmlFor="">Body 
                    <textarea name="" id="" cols="30" rows="10"></textarea>
                </label>

                <input type="submit" value="Create Todo"/>

            </form>
        )
    }


}