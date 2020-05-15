class ArtworkSharesController < ApplicationController
    def index
        render json: ArtworkShare.all
    end
    
    def create
        share = ArtworkShare.new(share_params)

        if share.save
            render json: share
        else
            render json: share.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        catch_record_not_found do
            share = ArtworkShare.find(params[:id])
            share.destroy
            render json: share
        end
    end

    def favorite
        catch_record_not_found do
            catch_parameter_missing do
                artwork_share = ArtworkShare.find(params[:id])
                if artwork_share.update(params.require(:artwork_share).permit(:favorite))
                    render json: artwork_share
                else
                    render json: artwork_share.errors.full_messages, status: :unprocessable_entity
                end
            end
        end
    end

    private
    def share_params
        params.require(:artwork_share).permit(:viewer_id, :artwork_id)
    end
end
