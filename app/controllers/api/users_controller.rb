class Api::UsersController < ApplicationController
    include UserModule

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            render json: @user, status: :created
        else
            render json: { error: @user.errors }, status: :unprocessable_entity
        end
    end

    def update_user_profile_img
        if current_user
            @user = current_user
            if @user.update(profile_img: user_params[:image])
                render json: { message: "User profile image updated" }
            else
                render json: { error: @user.errors }, status: :unprocessable_entity
            end
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :image)
    end
end
