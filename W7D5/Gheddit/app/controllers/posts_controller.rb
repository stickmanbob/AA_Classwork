class PostsController < ApplicationController

    before_action :ensure_post_author
    skip_before_action :ensure_post_author, except: [:edit, :update]

    ############################HELPER METHODS###############################
    def current_post
        Post.find(params[:id])
    end

    def ensure_post_author
        if logged_in? and  current_post.author_id == current_user.id
            return true 
        else 
            flash[:errors] = ["Must be logged in to edit post"]
            redirect_to new_session_url 
        end
    end
    #############################ROUTES######################################
    
    def post_params
        params.require(:post).permit(:title,:url,:content,:sub_id)
    end

    def new
        
        @post = Post.new(sub_id: params[:id]) 
        render :new
    end

    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id 
        # debugger
        if @post.save
            redirect_to sub_url(@post.sub_id)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new 
        end

    end

    def show
        @post = current_post
        
        render :show 
    end

    def edit
        @post = current_post
        render :edit 
    end

    def update
        @post = current_post
        @post.author_id = current_user.id 
        if @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit 

        end

    end




end
