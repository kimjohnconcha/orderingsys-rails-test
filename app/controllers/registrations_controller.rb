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

    end

    def destroy

    end

    private

    def user_params
        params.permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation)
    end

end
