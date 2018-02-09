class RegistrationsController < ApplicationController
    
    def index
    end

    def signin
    end

    def create
        user = User.new(user_params)
        if user.save
            sign_in(user)
            
        else

        end

        debugger
    end

    def new
        #debugger
        user = User.find_by(email: params[:email].downcase)
        if user
            if user.valid_password?(params[:password])
                sign_in(user)
                redirect_to root_path
            else
                flash[:danger] = "Invalid username and/or password."
                redirect_to signin_path
            end
        else
            flash[:danger] = "Invalid username and/or password."
            redirect_to signin_path
        end
    end

    def destroy

    end

    private

    def user_params
        params.permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation)
    end

end
