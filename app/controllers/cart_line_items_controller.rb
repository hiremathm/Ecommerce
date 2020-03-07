class CartLineItemsController < ApplicationController
	before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:increase_quantity, :decrease_quantity]
	def index
		@cart_line_items = current_user.cart_line_items.group_by(&:product_id)
		@total_quantity =  current_user.cart_line_items.map(&:quantity).inject(:+)
		@order = Order.new
		@addresses = current_user.addresses
	end
	def create
		@cart_line_item = CartLineItem.new(cart_line_item_params)
		@cart_line_item.user_id = current_user.id
		cart_line_item = CartLineItem.find_by product_id: cart_line_item_params["product_id"]
		if cart_line_item
			cart_line_item.quantity += cart_line_item_params["quantity"].to_i
			cart_line_item.save
			redirect_to cart_line_items_path, notice: "product has been successfully added to the cart."
		else
			if @cart_line_item.save
				redirect_to cart_line_items_path, notice: "product has been successfully added to the cart."
			else
				redirect_to cart_line_items_path, notice: "error in adding product to cart"				
			end
		end
	end
	def destroy 
		@cart_line_item = CartLineItem.find(params[:id])
		@cart_line_item.destroy
		redirect_to cart_line_items_path, notice: "the product was removed from your cart"
	end

	def increase_quantity
		cart_line_item = CartLineItem.find_by id: params["id"]
		cart_line_item.quantity = cart_line_item.quantity + 1
		cart_line_item.save
		total_quantity =  current_user.cart_line_items.map(&:quantity).inject(:+)
		price = cart_line_item.product.price * cart_line_item.quantity
		total_price = 0
		current_user.cart_line_items.each do |item|
			total_price += item.quantity * item.product.price
		end
		response = {data: "successfully added", status: true, quantity: cart_line_item.quantity, price: price, total_quantity: total_quantity, total_price: total_price}

		render json: response
	end

	def decrease_quantity
		cart_line_item = CartLineItem.find_by id: params["id"]
		cart_line_item.quantity = cart_line_item.quantity - 1
		cart_line_item.save
		price = cart_line_item.product.price * cart_line_item.quantity
		total_quantity =  current_user.cart_line_items.map(&:quantity).inject(:+)
		total_price = 0
		current_user.cart_line_items.each do |item|
			total_price += item.quantity * item.product.price
		end
		response = {data: "successfully added", status: true, quantity: cart_line_item.quantity, price: price, total_quantity: total_quantity, total_price: total_price}

		render json: response
	end

	private 

	def cart_line_item_params
		params[:cart_line_item].permit(:product_id, :quantity, :user_id)
	end

end
