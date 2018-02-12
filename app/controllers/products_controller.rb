class ProductsController < ApplicationController

    def index
        @products = Product.all
        if user_signed_in?
            @carts = Cart.joins('INNER JOIN products on product_id = products.id').where('user_id = ?', current_user.id)
        end        
    end

    def show
        @product = Product.find(params[:id]) rescue nil
        if user_signed_in?
            @carts = Cart.joins('INNER JOIN products on product_id = products.id').where('user_id = ?', current_user.id)
        end 
    end

    def search
        if params[:category].present?
            @products = Product.where('category like ?', params[:category])
        elsif params[:shoetype].present?
            @products = Product.where('shoetype like ?', params[:shoetype])
        else
            @product = Product.all
        end

        if user_signed_in?
            @carts = Cart.joins('INNER JOIN products on product_id = products.id').where('user_id = ?', current_user.id)
        end
    end

    def create
        @product = Product.new(product_params)

        if params[:name].present? && params[:price].present?
            if @product.save
                redirect_to root_path
            else
                flash[:danger] = "Invalid input. Please check product name and product price."
                redirect_to new_product_path
            end
        else
            flash[:danger] = "Invalid input. Please check product name and product price."
            redirect_to new_product_path
        end
    end


    def new
        if !user_signed_in?
            redirect_to root_path
        elsif !current_user.admin
            redirect_to root_path
        else
            @product = Product.new
        end
    end

    def all_products
        if !user_signed_in?
            redirect_to root_path
        elsif !current_user.admin
            redirect_to root_path
        else
            @products = Product.all
        end
    end

    def edit
        if !user_signed_in?
            redirect_to root_path
        elsif !current_user.admin
            redirect_to root_path
        else
            @product = Product.find(params[:id])
        end
    end

    def update
        if !user_signed_in?
            redirect_to root_path
        elsif !current_user.admin
            redirect_to root_path
        else
            @product = Product.find(params[:id])
            if @product.update(product_params_update)
                redirect_to products_all_products_path
            else
                flash[:danger] = "Invalid input. Please check product name and product price."
                redirect_to products_edit_path id: params[:id]
            end
        end
    end
    

    private


    def product_params
        params.permit(:name, :description, :price, :image, :category, :shoetype, :size, :highlights, :details)
    end

    def product_params_update
        params.permit(:id, :name, :description, :price, :image, :category, :shoetype, :size, :highlights, :details)
    end

end