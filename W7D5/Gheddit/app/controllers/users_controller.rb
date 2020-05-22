class UsersController < ApplicationController
    
   

    def index
        render :index 
    end

    def new
        # @user = User.new(user_params)
        render :new
    end

    def create
        # debugger
        @user = User.new(user_params)
        @user.password = params[:user][:password]
        # debugger 
        if @user.save
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            @user.pw_digest = nil 
            render :new 
        end
    end

   

    def show
        @user = User.find(params[:id])
    end

    def destroy
        user = User.find(params[:id])
        user.destroy 
        render :index 
    end
end
