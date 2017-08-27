class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many	:project_developers
  has_many	:projects, through: :project_developers
  has_many  :user_tasks
  has_many  :tasks, through: :user_tasks

  class << self

  	# Get all developers 
  	def get_all_developers
  		where(role_id: DEVELOPER_ROLE)
  	end

  end

  # Check if user is admin
  def is_admin?
    self.role_id.present? && ADMIN_ROLE_ID == self.role_id
  end
  
  def get_developer_tasks
      Task.joins("INNER JOIN user_tasks AS ut ON ut.task_id = tasks.id ")
      .select("ut.status as ut_status, ut.id as ut_id, tasks.name, tasks.description")
      .where("ut.user_id = ?", self.id)
  end

  def developer_status_report
    #User.joins('INNER JOIN user_tasks as ut ON ut.user_id = users.id INNER JOIN tasks as t ON t.id= ut.task_id').select("ut.status as ut_status, users.name as u_name, t.name").where("users.role_id": DEVELOPER_ROLE).order("ut.status")
    User.joins('INNER JOIN user_tasks as ut ON ut.user_id = users.id').select("users.id, ut.status as ut_status, users.name as u_name").where("users.role_id": DEVELOPER_ROLE).order("ut.status").group("ut.status, users.id")
    #User.includes(:user_tasks).includes(:tasks)
  end


end
