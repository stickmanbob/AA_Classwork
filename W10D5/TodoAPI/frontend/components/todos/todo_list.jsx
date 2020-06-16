import React from 'react';
import TodolistItem from './todolist_item'
import TodoForm from "./todo_form"

export default (props)=> {
    return(
        <div>
            <h3>Todo List</h3>
            <ul> {props.todos.map((el, idx) => <TodolistItem key={idx} todo={el} />)}</ul>
            <TodoForm receiveTodo={props.receiveTodo}/>
        </div>
    
   )
} ;

