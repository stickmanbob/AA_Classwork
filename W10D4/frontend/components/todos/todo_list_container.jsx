
import {connect} from "react-redux";
import {allTodos} from "../../reducers/selectors";
import * as actions from "../../actions/todo_actions";
import TodoList from "./todo_list";

const mapStatetoProps =  function(state){
    return {todos: allTodos(state)};

};

const mapDispatchtoProps = function(dispatch){
    return {
        receiveTodo: todo => (actions.receiveTodo(todo)),
    }
};

export default connect(mapStatetoProps,mapDispatchtoProps)(TodoList);

