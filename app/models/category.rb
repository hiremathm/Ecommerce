class Category < ActiveRecord::Base
	has_many :products
	has_many :sub_categories
	# extend FriendlyId
 #  friendly_id :name, use: :slugged
end