class CollectionsController < ApplicationController
    def index 
        catch_record_not_found do 
            user = User.find(params[:user_id])
            render json: user.collections 
        end
    end

    def show
        catch_record_not_found do
            collection = Collection.find(params[:id])
            render json: collection.artworks
        end
    end

    def create 
        catch_parameter_missing do 
            collection = Collection.new(collection_params)
            if collection.save
                render json: collection 
            else
                render json: collection.errors.full_messages, status: :unprocessable_entity
            end
        end
    end

    def destroy
        collection = Collection.find(params[:id])
        collection.destroy 
        render json: collection 
    end

    private
    def collection_params
        params.require(:collection).permit(:title, :collector_id)
    end
end
