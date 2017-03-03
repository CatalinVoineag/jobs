class ProductsController < ApplicationController

	def index
		products = Product.all
		@products = products.limit(10)
		@job = Delayed::Job.first
	end

	def new
		@product = Product.new
	end

	def progress_job
		begin
			@job = Delayed::Job.where(id: params[:job_id]).first
			
		  percentage = !@job.progress_max.zero? ? @job.progress_current / @job.progress_max.to_f * 100 : 0
		  render json: @job.attributes.merge!(percentage: percentage).to_json
		rescue
			render json: ''
		end
	end

	def create
		
		#Delayed::Job.enqueue ProductJob.new(product_params, action="creation"

		flash[:notice] = "We are creating your products"
		redirect_to root_path
	end

	def download_csv

		id = rand(1000)

		@job = Delayed::Job.enqueue ProductJob.new(id)
		#redirect_to root_path
	end




	private 

		def product_params
			params.require(:product).permit(:product_code, :cost, :owner, :depot_id)
		end

end
