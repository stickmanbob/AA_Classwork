class Api::TodosController < ApplicationController
    def show 
        todo = Todo.find_by(pramas[:id])
        render json: todo
    end 

    def index 
        todos = Todo.all 
        render json: todos
    end 

    def update 
       todo = Todo.create(todo_params)
        if todo.save  
            render json:todo 
        else 
            render json: todo.errors.full_messages, status:422
        end 

    end 

    def destroy 
        todo = Todo.find_by(params[:id])
        if todo.delete 
            render json: " #{todo}is deleted "
        else 
        end 
    end 

    def todo_params 
    params.require(:todo).permit(:title,:body,:done)
    end 
end


