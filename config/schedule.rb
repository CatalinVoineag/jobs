set :output, {:standard => '~/Jobs/log/cron.log', :error => '~/Jobs/log/error_cron.log'}


 every 1.minute do
 	 puts "WORKING?!!!" 
   command "cd /Jobs && RAILS_ENV=development bin/delayed_job start"
 end



# Learn more: http://github.com/javan/whenever
