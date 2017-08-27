class AdminReportsController < ApplicationController

	before_filter :check_admin
	
	# Get Pie chart data of projects
	def get_project_data
		project_data = Project.show_project_report(Project.all.collect(&:id))
		respond_to do |format|
			format.json { render json: {'data': project_data.to_json}}	
		end
	end


end
