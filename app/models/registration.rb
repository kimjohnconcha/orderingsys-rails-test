class Registration < ApplicationRecord


    def new

    end

    def create

    end


    def destroy
        sign_out(current_user)
        redirect_to root_path
    end


    private

    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end
end
