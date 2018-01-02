class ProductsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :check_is_admin, except: [:index, :show]
	def index
		@products = Product.all
		@products = Product.paginate(:page => params[:page])
		@product = Product.new
	end

	# is used for instantiate an object and setup form
	def new
		@product = Product.new
	end
# is used to validate the information is coming from the form, if the validations pass insert the record to the data base and redirect the user to another page, else display the error messages on the form telling the user why the form failed
	def create
		@product = Product.new(product_params)
		if @product.save
			
			redirect_to product_path(@product.id)
		else
			render action: "new"
		end
	end
	def show
		@product = Product.find(params[:id])
		@category = Category.find(@product.category_id)
		@review = Review.new
		@cart_line_item = CartLineItem.new
	end
	def edit
		@product = Product.find(params[:id])
	end
	def update
		@product = Product.find(params[:id])
		if @product.update_attributes (product_params)
			redirect_to products_path,  notice:"product succesfully updated"
		else
			render action: "edit"
		end
	end
	def destroy 
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path, notice:"product succesfully deleted"
	end
	private
# strong parameters - used to prevent from mass assignment web attack
	def product_params
		params[:product].permit(:name, :category_id, :price, :description, :stock, :sub_cat_id,:tax_id, :net_price,:cod_eligible, :release_date, :image_url)
	end
end