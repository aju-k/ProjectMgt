class Task < ActiveRecord::Base
	has_many :user_tasks
	has_many :users, through: :user_tasks



  def self.get_task_by_status(task_status, user_id)
    joins('INNER JOIN user_tasks as ut ON ut.task_id = tasks.id').where("ut.status =? and ut.user_id = ?", task_status, user_id)
  end


end
