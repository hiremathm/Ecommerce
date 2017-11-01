class Product < ActiveRecord::Base
	
	before_create :generate_code


	has_many :reviews
	belongs_to :category
	has_many :cart_line_items
	has_many :order_line_items
	validates_presence_of :name, :description, :price, :stock, :category_id
	validates_numericality_of :price, :category_id, greater_than:0
	validates_numericality_of :stock, greater_than_or_equal_to:0
	validates_length_of :name, minimum: 5
	validates_length_of :description, within: 5..250
	validates_uniqueness_of :name
	
	# provides for adding custom validations
	validate :check_cod_eligible
	validate :check_release_datetime
	
	private
	def generate_code
		self.code = "DCT-#{SecureRandom.hex[0...4]}"
	end
	def check_release_datetime
		if self.release_date > Date.today + 3.months
			self.errors.add(:release_date, "cannot be greater than 3 months") 
		end
	end
	def check_cod_eligible
		if !self.price.nil? && self.price >= 25000 && self .cod_eligible
			self.errors.add(:cod_eligible, "products below 25000 are only eligible")
		end
	end

end