class ProductJob < Struct.new(:product_params, :action)

    class JobErrorException < StandardError; end

    def enqueue(job)
      #check_and_update_status
      # Scope to depot
      #zone = Zone.find(location_params[:zone_id])
      

      @job = job
      
      @job.delayed_reference_id   = product_params[:depot_id]
      @job.delayed_reference_type = 'Depot:Product'
      @job.status = 'processing'
      @job.save!
    end

    def success(job)
      # update_status('success')
      job.update_attribute(:status, 'success') 
           
      # Alert.create(message: "Your Locations have been created", depot_id: zone.depot.id, alert_type: 'background_job')
    end

    def error(job, exception)
      job.update_attribute(:status, 'error')
      # Scope to depot
      # Alert.create(message: "Location Errors: " + exception.message, depot_id: zone.depot.id, alert_type: 'background_job')
      #update_status('temp_error')
      # Send email notification / alert / alarm
    end

    def failure(job)
      job.update_attribute(:status, 'failure')
    #  update_status('failure')
      # Send email notification / alert / alarm / SMS / call ... whatever
    end

    def perform
    	if action == "creation"
	      10000.times do 
					@product = Product.new(product_params)
					@product.save
				end
			elsif action == "deletion"
				Product.destroy_all
			end
				
		end

    private

    # def update_status(status)
    # 	byebug
    # 	1 == 1
    #   location_setup = ProductJob::Zone.find zone_id
    #   location_setup.status = status
    #   location_setup.save!
    # end

    # def check_and_update_status
    #   location_setup = LocationSetup::Zone.find zone_id
    #   raise StandardError.new("LocationSetup: #{location_setup.id} is not on status 'new' (status: #{location_setup.status}") unless location_setup.status == 'new'
    #   location_setup.status = 'processing'
    #   location_setup.save!
    # end

end