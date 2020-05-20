class SessionsController < ApplicationController

    def new
        render :new 
    end

    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if user 
            login_user!(user)
            redirect_to user_url(user)
        else
            flash[:errors] = ["invalid credentials!"]
            redirect_to new_sessions_url
        end
    end

    def destroy
        user = current_user

        user.reset_session_token!
        session[:session_token] = nil 
        redirect_to new_sessions_url
    end
end
