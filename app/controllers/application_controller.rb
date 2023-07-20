class ApplicationController < ActionController::API
    def not_found
        render json: { error: 'not_found' }, status: :not_found
    end

    def authorize_request
        begin
            @current_user = User.find(session[:user_id])
        rescue ActiveRecord::RecordNotFound => e
            render json: { errors: "You should first log in" }, status: :unauthorized
        end
    end

end
