class TasksController < ApplicationController

	before_action :set_project, only: [:new, :index, :create]
	before_action :check_admin, only: [:new, :index, :create]	

	# Create new task
	def new
		@developers = @project.users
	end

	# Create user tasks
	def create
		@task = @project.tasks.create(task_params)
		params[:developers].each do |id|
			@task.user_tasks.create(user_id: id)
		end
		redirect_to action: "index"
	end

	# Get all tasks
	def index
	end

	# Delete task 
	def destroy
		@task = Task.find_by_id(params[:id])
		@task.destroy
		redirect_to action: "index"
	end

	# List tasks of users
	def list_user_tasks
		@tasks = current_user.get_developer_tasks
	end

	def update_task_status
		if params[:task_id].present? && params[:task_status].present?
			task = UserTask.find_by_id(params[:task_id])
			task.update_attributes(status: params[:task_status]) if task.present?
			msg = 'Status updated'
		else
			msg = 'Task not found'
		end
		respond_to do |format|
			format.json { render json: {'response': msg}.to_json}	
		end
	end


	private

		def set_project
			@project = Project.find_by_id(params[:project_id])
		end

		def task_params
			params.require(:task).permit(:name, :description)
		end


end
