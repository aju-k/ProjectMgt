Rails.application.routes.draw do
	root 'admin_reports#show_project_pie_chart'	
	devise_for :users
	resources :projects do 
		resources :tasks
	end
	get '/list_user_tasks', to: 'tasks#list_user_tasks', as: 'list_user_tasks'
	post '/update_task_status', to: 'tasks#update_task_status'
	get '/show_project_pie_chart', to: 'admin_reports#show_project_pie_chart', as: 'show_project_pie_chart'
	get '/get_project_pie_data', to: 'admin_reports#get_project_data'
end
