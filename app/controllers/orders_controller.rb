class OrdersController < ApplicationController

    def index
        if user_signed_in?
            @carts = Cart.joins('INNER JOIN products on product_id = products.id').where('user_id = ?', current_user.id)
            @orders = Order.joins(:order_items).where('user_id = ?', current_user.id)
            if current_user.admin
                @orders = Order.all
            end
        else
            redirect_to root_path
        end

    end


    def create
        require 'securerandom'

        @order = Order.create(:user_id => current_user.id, :order_number => SecureRandom.hex(7))

        @cart = Cart.where('user_id = ?', current_user.id)
        @cart.all.each do |c|
            @order_item = OrderItem.new(:quantity => c.quantity, :order_id => @order.id, :product_id => c.product_id)
            @order_item.save!
        end
        @cart.delete_all

        redirect_to orders_path
    end







end