class BandsController < ApplicationController
    def index
        render :index 
    end

    def new
        band = Band.new 
        render :new 
    end

    def create
        band = Band.new(params.require(:band).permit(:name))
        
        if band.save
            redirect_to bands_url
        else
            flash[:errors] = ["Error Creating Band"]
            redirect_to bands_url
        end
    end

    def destroy
        band = find_by_id(Band) #method defined in application controller 

        band.destroy

        redirect_to bands_url
    end

    def show
        @band = find_by_id(Band)
        render :show
    end


end
