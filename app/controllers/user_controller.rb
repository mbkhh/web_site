class UserController < ApplicationController
    before_action :authorize_request, except:  %i[create show]
    def index
        render json:@current_user
    end
    def create
        if !user_exist(create_user_params[:username])
            begin
                user = User.new(create_user_params)
                if user.save
                    render json: {success: "user added successfuly"}
                else
                    render json: {errors:user.errors.full_messages} , status: :unprocessable_entity
                end
            rescue Exception => e
                render json: {error: e.getmessage()},status: :unprocessable_entity
            end
        else
            render json: {error:"username already exist"},status: :unprocessable_entity
        end
        rescue ActionController::ParameterMissing
            render json: {error:"missing parameters"} , status: :bad_request
    end
    def update
        if @current_user.update(update_user_params)
            render json: {"success":"user updated successfuly"}
        else
          render json: { errors: @current_user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end
    def show
        @user = User.find_by_username(params[:username])
        if !@user.nil?
            render json: @user, status: :ok
        else
            not_found
        end
    end

    private

    def user_exist(username)
        user = User.find_by_username(username)
        if user.nil?
            false
        else
            true
        end
    end
    def create_user_params
        params.require(:username)
        params.require(:password)
        params.require(:name)
        params.require(:email)
        params.permit(:username ,:password ,:name ,:email ,:biography ,:phoneNumber ,:address ,:outerLink ,:role ,:avatar ,:resume)
    end
    def update_user_params
        params.permit(:username ,:password ,:name ,:email ,:biography ,:phoneNumber ,:address ,:outerLink ,:role ,:avatar ,:resume)
    end
end
