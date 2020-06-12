import React from 'react';
import TodolistItem from './todolist_item'
export default (props)=> {
    return(
        <div>
            <h3>Todo List</h3>
            <ul> {props.todos.map((el, idx) => <TodolistItem childKey={idx} todo={el} />)}</ul>
        </div>
    
   )
} ;

