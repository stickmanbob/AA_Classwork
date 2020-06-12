import {RECEIVE_TODO} from "../actions/todo_actions";
import { RECEIVE_TODOS } from "../actions/todo_actions";

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};

const todosReducer = (state = initialState, action) => {
    Object.freeze(state);
    switch (action.type) {
        case RECEIVE_TODOS:
            let todoObj = {};
            action.todos.forEach((todo) => {
            todoObj[todo.id] = todo;
            });
            return todoObj;
            break; 
        case RECEIVE_TODO:
            todoObj = {}
            todoObj[action.todo.id] = action.todo;
            let newObj = Object.assign({}, state); 
            return Object.assign(newObj,todoObj);
            break; 
            
        default:
            return state;
        
    }
};

export default todosReducer;