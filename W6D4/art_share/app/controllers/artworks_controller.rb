class ArtworksController < ApplicationController
    def index
        user_artworks = User.select('artworks.*').joins(:artworks).where(id: params[:user_id])
        shared_artworks = User.select('artworks.*').joins(:shared_artworks).where(id: params[:user_id])

        render json: (user_artworks + shared_artworks)
    end

    def create 
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork 
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        catch_record_not_found do 
            artwork = Artwork.find(params[:id])
            render json: artwork 
        end
    end

    def update
        catch_record_not_found do
            artwork = Artwork.find(params[:id])
            if artwork.update(artwork_params)
                render json: artwork
            else
                render json: artwork.errors.full_messages, status: :unprocessable_entity
            end
        end
    end

    def destroy
        catch_record_not_found do 
            artwork = Artwork.find(params[:id])
            artwork.destroy 
            render json: artwork
        end
    end

    def favorite
        catch_record_not_found do
            catch_parameter_missing do
                artwork = Artwork.find(params[:id])
                if artwork.update(params.require(:artwork).permit(:favorite))
                    render json: artwork
                else
                    render json: artwork.errors.full_messages, status: :unprocessable_entity
                end
            end
        end
    end

    private 
    def artwork_params
        params.require(:artwork).permit(:artist_id,:title,:img_url)
    end
end
