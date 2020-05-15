class CommentsController < ApplicationController
    def index
        catch_parameter_missing do 
            if comment_params[:user_id]
                comments = Comment.find_by(user_id: comment_params[:user_id])
                render json: comments
            elsif comment_params[:artwork_id]
                comments = Comment.find_by(artwork_id: comment_params[:artwork_id])
                render json: comments
            else
                render json: "Comment not found.", status: :not_found
            end
        end
    end

    def create
        comment = Comment.new(comment_params)

        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        render json: comment
    end

    private
    def comment_params
        params.require(:comment).permit(:body, :user_id, :artwork_id)
    end
end
