class Address < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :details, :user_id, :landmork, :city, :state, :pincode
	validates_numericality_of :user_id, :pincode
	validates_length_of :pincode, is: 6
end
