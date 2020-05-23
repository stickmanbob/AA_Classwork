class CommentsController < ApplicationController

    def new
        @comment = Comment.new(post_id:params[:id]) #in this case, the route is /post/:id/comments/new
        render :new
    end

    def create
        @comment = Comment.new(params.require(:comment).permit(:content,:post_id))
        @comment.author_id = current_user.id 
        if @comment.save
            redirect_to post_url(@comment.post_id)
        else
            flash.now[:errors] = @comment.errors.full_messages
            render :new
        end
    end
end
