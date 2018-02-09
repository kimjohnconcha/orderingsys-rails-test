class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    def search


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

    private


    def product_params
        #debugger
        params.permit(:name, :description, :price, :image)
    end

end