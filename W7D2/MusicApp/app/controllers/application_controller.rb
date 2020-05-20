class ApplicationController < ActionController::Base

      helper_method :current_user #allows using the #current_user method in views
    
    def current_user
        user = User.find_by(session_token: session[:session_token])
    end

    def login_user!(user)
        session[:session_token] = user.reset_session_token!
    end

    def find_by_id(model_class) 
        # finds an instance of the model class with ID matching params[:id]
        model_class.find(params[:id])
    end
end
