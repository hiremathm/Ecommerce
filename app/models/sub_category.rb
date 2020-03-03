class SubCategory < ActiveRecord::Base
	belongs_to :category
	has_many :products
	has_many :sub_category_items
end
