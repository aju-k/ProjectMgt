class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # Check admin 
  def check_admin
    unless current_user.is_admin? 
      return redirect_to list_user_tasks_path
    end
  end
  
  # After sigin redirect to specfic path
  def after_sign_in_path_for(resource)
  	if current_user.is_admin?
      developer_status_report_path
  	else
  		list_user_tasks_path
  	end
  end

end
