class CartsController < ApplicationController

def index
    if !user_signed_in?
        redirect_to root_path
    elsif !current_user.admin
        redirect_to root_path
    else
        @carts = Cart.joins('INNER JOIN products on product_id = products.id').where('user_id = ?', current_user.id)
    end
end

def create
    if user_signed_in?
        @cart = Cart.new(:product_id =>  params[:product], :quantity =>  params[:quantity], 
            :user_id => current_user.id, :size => params[:size])
        if @cart.save
            render json: { message: "added to cart", status: 200}, status: 200
        end
    else
        render json: { message: "Not signed in", status: 300}, status: 300
    end
end

def destroy
    @cart = Cart.find(params[:id])

    if @cart.destroy
        render json: { message: "Success", status: 200}, status: 200
    else
        render json: { message: "Delete Error", status: 300}, status: 300
    end



end


end