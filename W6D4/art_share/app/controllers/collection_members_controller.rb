class CollectionMembersController < ApplicationController

    def create 
        catch_parameter_missing do 
            member = CollectionMember.new(member_params)
            if member.save
                render json: member 
            else
                render json: member.errors.full_messages, status: :unprocessable_entity
            end
        end
    end

    def destroy
        member = CollectionMember.find(params[:id])
        member.destroy
        render json: member 
    end

    private
    def member_params
        params.require(:member).permit(:collection_id, :artwork_id)
    end
end
