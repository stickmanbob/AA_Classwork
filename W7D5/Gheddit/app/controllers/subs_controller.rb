class SubsController < ApplicationController

    before_action :ensure_moderator
    skip_before_action :ensure_moderator, except: [:edit, :update, :destroy]

    #######################HELPER METHODS###################################
    def current_sub
        Sub.find(params[:id])
    end

    def sub_params
        params.require(:sub).permit(:title, :description)
    end

    def ensure_moderator
        redirect_to sub_url(current_sub) unless is_moderator?(current_user)
    end

    def is_moderator?(user)
        sub = current_sub
        user.id == current_sub.moderator_id
    end

    #####################ROUTES######################################

    def new
       render :new 
    end

    def create
        sub = Sub.new(sub_params)
        sub.moderator_id = current_user.id 
        if sub.save
            redirect_to sub_url(sub)
        else
            flash.now[:errors] = sub.errors.full_messages
            render :new
        end
    end 

    def edit
        @sub = current_sub
        render :edit 
    end

    def update 
        @sub = current_sub
        
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit 
        end

    end

    def show
        @sub = current_sub
        render :show
    end

    def destroy
        @sub = current_sub
        @sub.destroy
        redirect_to user_url(current_user)
    end


end
