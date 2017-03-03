// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .


function progress_job(job_id) {
	if (job_id.length > 0) {
		var interval;
	  	interval = setInterval(function(){
	    $.ajax({
	      url: '/progress_products/' + job_id,
	      success: function(job){
	        var stage, progress;

	        // If there are errors
	        if (job.last_error != null) {
	          $('.progress-status').addClass('text-danger').text(job.progress_stage);
	          $('.progress-bar').addClass('progress-bar-danger');
	          $('.progress').removeClass('active');
	          clearInterval(interval);
	        }

	        progress = job.progress_current / job.progress_max * 100;
	        progress = progress.toFixed(2)
	        // In job stage
	        if (progress.toString() !== 'NaN'){
	          $('.progress-status').text(job.progress_current + '/' + job.progress_max);
	          $('.progress-bar').css('width', progress + '%').text(progress + '%');
	        }
	      },
	      error: function(){
	        // Job is no loger in database which means it finished successfuly
	        $('.progress').removeClass('active');
	        $('.progress-bar').css('width', '100%').text('100%');
	      $('.progress-status').text('Successfully exported!');
	        $('.export-link').show();
	        clearInterval(interval);
	      }
	    })
	  },100);
	}
}