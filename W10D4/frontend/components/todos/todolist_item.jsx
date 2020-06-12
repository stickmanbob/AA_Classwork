import React from 'react';

const TodolistItem = function(props) {
    return (
        <li key={props.childKey}>{props.todo.title}</li>
    )
}
export default TodolistItem;