class AddProgressBarToDelayedJobs < ActiveRecord::Migration
  def change
  	add_column :delayed_jobs, :progress_stage, :string
  	add_column :delayed_jobs, :progress_current, :integer, default: 0 
  	add_column :delayed_jobs, :progress_max, :integer, default: 0
  end
end