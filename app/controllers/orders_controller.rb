class OrdersController < ApplicationController

    def index
        if user_signed_in?

        else
            redirect_to root_path
        end

    end


    def create


    end







end