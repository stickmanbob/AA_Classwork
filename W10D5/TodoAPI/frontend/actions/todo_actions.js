
export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

export const receiveTodos = (todos)=> {
    
    return {
        type : RECEIVE_TODOS,
        todo : todos
    }

}

export const receiveTodo = (todo) => {
    return {
        type : RECEIVE_TODO,
        todo : todo
    }
}



window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;