class SessionsController < ApplicationController

    def new
        # @user = User.new(user_params)
        render :new
    end

    def create 
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if user 
            login_user!(user)
            redirect_to user_url(user)
        else
            # @user = User.new(user_params)
            flash.now[:errors] = ["Invalid Credentials!"]
            render :new 
        end

    end

    def destroy
        if logged_in?
            logout_user(current_user)
            render :new 
        else
            render :new 
        end
    end
end
