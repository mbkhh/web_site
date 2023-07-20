class AuthenticationController < ApplicationController
    def login
        if !session[:user_id]
            begin
                user = User.where("username = ? AND password = ?",login_params[:username],login_params[:password])
                #render json: @user.as_json
                if user.size != 0
                    session[:user_id] = user[0].id
                    render json: {success: "logged in successfuly"}
                else
                    render json: { error: 'username or password don\'t exist' }, status: :unauthorized
                end
            rescue ActionController::ParameterMissing
                render json: {error:"missing parameters"} , status: :bad_request
            end
        else
            #authorize_request
            render json: {error:"You already have logged in"} , status: :bad_request
        end
        
    end
    def logout
        session.delete(:user_id)
        render json: {success: "logged out successfuly"}
    end

    private

    def login_params
        params.require(:username)
        params.require(:password)
        params.permit(:username, :password)
    end
end
