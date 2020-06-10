if(window.localStorage.getItem("todos")){
todosArr = JSON.parse(window.localStorage.getItem("todos"))
} else{
    todosArr = [];
}
// debugger
// var todosArr =  || [];

// console.log(window.localStorage.getItem("todos"))

class Todo{
    constructor(name){
        this.name = name;
        this.done = false; 
    }
}
var todosList = document.getElementsByClassName("todos")[0];

var addTodoForm = document.getElementsByClassName('add-todo-form')[0];


function addTodo(){
    event.preventDefault();
    let addTodo = document.getElementsByName("add-todo")[0];
    let todoName = addTodo.value;
    let newTodo = new Todo(todoName);
    todosArr.push(newTodo);
    addTodo.value = ""; 
    localStorage.setItem("todos",JSON.stringify(todosArr));
    debugger
    populateList(todosArr);

}

function populateList(todos){
    while(todosList.firstChild){
        todosList.removeChild(todosList.lastChild);
    }
    todos.forEach((todo)=>{
        let label = document.createElement("label");
        label.appendChild(document.createTextNode(todo.name));
        let checkbox =document.createElement("input");
        checkbox.type = "checkbox";
        let li = document.createElement("li");
        li.appendChild(label);
        li.appendChild(checkbox);
        todosList.appendChild(li);

    })
}

addTodoForm.addEventListener("submit",addTodo);

