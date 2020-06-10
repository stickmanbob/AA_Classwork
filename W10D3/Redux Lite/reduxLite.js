class Store {

    constructor(rootReducer) {
        this.rootReducer = rootReducer; //is a function
        this.state = {}; //is the global state 
        this.getState = this.getState.bind(this);
    }

    getState() {
        return Object.assign({},this.state);
    }
}

let state = {name:"Ajay", job:"Unemployment bum"};
let action = {type:"changeName", newName: "Ashe"};
//goal {name: "ashe", job: 'unemployment'}
const nameReducer = (oldname = state[name], action) =>{
    
}