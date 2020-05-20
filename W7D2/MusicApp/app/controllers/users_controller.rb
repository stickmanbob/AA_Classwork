class UsersController < ApplicationController

    def new
        @user = User.new 
        render :new 
    end

    def create
        @user = User.new(email: params[:user][:email])
        @user.password= params[:user][:password]
        if @user.save
            login_user!(user)
            redirect_to user_url(@user)
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end

    end

    def user_params
        params.require(:user).permit(:email, :password)
    end

    def show
        @user = User.find(params[:id])
        render :show
    end
end
