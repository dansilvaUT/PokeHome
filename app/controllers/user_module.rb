module UserModule
    def login!
        session[:user_id] = @user.id
    end

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def authorized_user?
        @user == current_user
    end

    def logout!
        session.clear
    end

    def set_user
        @user = User.find_by(id: session[:user_id])
    end

    def logged_in_user
        unless logged_in?
            render json: { status: 401, message: "You need to be logged in" }
        end
    end
end
