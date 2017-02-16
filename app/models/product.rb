class Product < ActiveRecord::Base

	belongs_to :depot

	def self.create_product
		10.times do 
			self.product_code = "Product"
			self.cost = 10
			self.owner = "owner1"
			self.save
		end
	end

end
