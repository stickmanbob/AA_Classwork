class UsersController < ApplicationController
    def index
        catch_parameter_missing(User) do
            if user_params[:username]
                users = User.where("users.username Like '%#{user_params[:username]}%'")
                render json: users 
            end 
        end
        
    end

    def liked_comments
        catch_record_not_found do 
            user = User.find(params[:id])
            comments = user.liked_comments
            render json: comments
        end
    end

    def liked_artworks
        catch_record_not_found do 
            user = User.find(params[:id])
            artworks = user.liked_artworks
            render json: artworks
        end
    end

    def create
        user = User.new(user_params)

        if user.save
            render json: user 
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        catch_record_not_found do
            user = User.find(params[:id])
            render json: user
        end
    end

    def update
        catch_record_not_found do
            user = User.find(params[:id])
            if user.update(user_params)
                render json: user
            else   
                render json: user.errors.full_messages, status: :unprocessable_entity
            end
        end
    end

    def destroy
        catch_record_not_found do
            user = User.find(params[:id])
            user.destroy
            render json: user
        end
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end