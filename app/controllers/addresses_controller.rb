class AddressesController < ApplicationController
	
	def index
		@addresses =current_user.addresses
		@address = Address.new
	end

	def create
		@address = Address.new(address_params)
		@address.user_id = current_user.id
		if @address.save
			redirect_to addresses_path, notice: "Your address is successfully added"
	
		end
	end

	private
	def address_params
		params[:address].permit(:details,:state,:city,:pincode,:landmork)
	end

end
