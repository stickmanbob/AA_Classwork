import React from 'react';

const TodolistItem = function(props) {
    return (
        <li>{props.todo.title}</li>
    )
}
export default TodolistItem;