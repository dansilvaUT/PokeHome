class Api::UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            render json: @user, status: :created
        else
            render json: { error: @user.errors }, status: :unprocessable_entity
        end
    end

    # TODO: Add edit/update methods

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
