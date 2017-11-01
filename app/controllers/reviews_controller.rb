class ReviewsController < ApplicationController
	before_action :authenticate_user!
	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		if @review.save
			redirect_to product_path(@review.product_id)
		end
	end
	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to :back
	end
	private
	def review_params
		params[:review].permit(:title, :description, :rating, :product_id)
	end


end
