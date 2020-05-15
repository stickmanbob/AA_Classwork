class ApplicationController < ActionController::Base
    def catch_record_not_found(&prc)
        begin
            prc.call
        rescue ActiveRecord::RecordNotFound => e
            render json: e
        end
    end
    
    def catch_parameter_missing(model = nil,&prc)
        begin
            prc.call 
        rescue ActionController::ParameterMissing => e 
            if model
                render json: model.all 
            else
                render json: e 
            end
        end
    end
end
