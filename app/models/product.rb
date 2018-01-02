class Product < ActiveRecord::Base
	
	before_create :generate_code
	before_save :check_net_price

	has_many :reviews
	belongs_to :category
	has_many :cart_line_items
	has_many :order_line_items
	belongs_to :tax
	belongs_to :sub_category

	validates_presence_of :name, :description, :price, :stock, :category_id
	 validates_numericality_of :price, :category_id
	 validates_numericality_of :stock
	#validates_length_of :name, minimum: 5
	 #validates_length_of :description, minimum: 5
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

	def check_net_price
		#binding.pry
		self.net_price = self.price + (self.price * self.tax_id)/100
		#binding.pry
	end

end