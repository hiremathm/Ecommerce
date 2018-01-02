class AjaxController < ApplicationController
	  def find_by_categories
	  	if params[:category_ids] != ""
	    	@products = Product.where(category_id: params[:category_ids].split(","))
	    else 
	     	@products = Product.all
	    end 
	    	render json: @products
	  	end

	  def autocomplete
	    if params[:search] != ""
	    
	      @products = Product.where('name LIKE ?', "%#{params[:search]}%")
	    else
	      @products = Product.all
	    end
	    render json: @products
	  end

	 def cod_eligible
	    @products = params[:cod] ? Product.where('cod_eligible = ?', true ) : Product.where('cod_eligible = ?', false)
	    render json: @products
	  end

	 def by_price_asc
	 	@products = Product.order(:price)
	 	render json: @products
	 end

	 def by_price_desc
	 	@products = Product.order(price: :desc)
	 	render json: @products
	 end

	 def By_price_between_100_to_500
	 	@products = Product.where('price BETWEEN ? AND ?',100,500)
	 	render json: @products
	 end

	 def By_price_less_than_100
	 	@products = Product.where('price < ?',100)
	 	render json: @products
	 end
	 def By_price_greater_than_500
	 	@products = Product.where('price > ?',500)
	 	render json: @products
	end

	def By_slider
		@products = Product.where('price > ?', params[:price]);
	 	render json: @products
	end

	def By_slider1
		@products = Product.where('price < ?', params[:price]);
	 	render json: @products
	end
end
