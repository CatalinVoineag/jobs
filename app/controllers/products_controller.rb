class ProductsController < ApplicationController

	def index
		products = Product.all
		@products = products.limit(10)
	end

	def new
		@product = Product.new
	end

	def create
		
		

		Delayed::Job.enqueue ProductJob.new(product_params, action="creation")


		flash[:notice] = "We are creating your products"
		redirect_to root_path
	end

	def delete_all_products

		
	end

	private 

		def product_params
			params.require(:product).permit(:product_code, :cost, :owner, :depot_id)
		end

end
