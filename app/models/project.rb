class Project < ActiveRecord::Base
	has_many :tasks
	has_many :project_developers
	has_many  :users, through: :project_developers

	def self.show_project_report(project_ids)
		UserTask.joins("INNER JOIN tasks as t on t.id = user_tasks.task_id INNER JOIN projects as pr on pr.id = t.project_id")
		.select("pr.name, sum( CASE WHEN user_tasks.status='NOT_STARTED' THEN 1 ELSE 0 end) as not_started, sum(CASE WHEN user_tasks.status = 'IN_PROGRESS' THEN 1 ELSE 0 END) as in_progress, sum(case when user_tasks.status = 'DONE' THEN 1 ELSE 0 END) as done").where("t.project_id IN (?)",project_ids).group("pr.name")
	end

end
