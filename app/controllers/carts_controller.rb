class CartsController < ApplicationController

def index
     @carts = Cart.joins('INNER JOIN products on product_id = products.id').where('user_id = ?', current_user.id)
end

def create
    @cart = Cart.new(:product_id =>  params[:product], :quantity =>  params[:quantity], 
        :user_id => current_user.id, :size => params[:size])
    if @cart.save
      redirect_to carts_path
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