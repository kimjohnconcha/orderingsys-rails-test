class OrdersController < ApplicationController
    before_action :set_description

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

        order_no = nil

        loop do
            order_no = gen_order_number
            break unless Order.exists?(:order_number => order_no)
        end

        customer = Stripe::Customer.create( :email => params[:stripeEmail], :source  => params[:stripeToken])

        charge = Stripe::Charge.create(
            :customer    => customer.id,
            :amount      => params[:amount],
            :description => 'Nike-Market Purchase',
            :currency    => 'usd'
          )

        @order = Order.create(:user_id => current_user.id, :order_number => order_no)

        @cart = Cart.where('user_id = ?', current_user.id)
        @cart.all.each do |c|
            @order_item = OrderItem.new(:quantity => c.quantity, :order_id => @order.id, :product_id => c.product_id)
            @order_item.save!
        end
        @cart.delete_all

        redirect_to orders_path
    end

    private

    def gen_order_number
        return DateTime.now.strftime("%Y%m").to_s + SecureRandom.hex(16/4).upcase
    end

    def set_description
        @description = "Final Proj Test Payment"
    end


end