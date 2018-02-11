class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    def search
        @products = Product.all
    end

    def create
        @product = Product.new(product_params)

        if @product.save
            redirect_to root_path
        else
            render new
        end
    end


    def new
        @product = Product.new
    end

    def all_products
        if !user_signed_in?
            redirect_to root_path
        
        elsif !current_user.admin
            redirect_to root_path
        else
            @product = Product.all
        end
    end

    private


    def product_params
        #debugger
        params.permit(:name, :description, :price, :image)
    end

end