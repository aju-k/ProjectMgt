class CreateUserTasks < ActiveRecord::Migration
  def change
    create_table :user_tasks do |t|
      t.integer	:task_id
      t.integer	:user_id
      t.string	:status, default: NOT_STARTED
      t.timestamps
    end
    add_index :user_tasks, :task_id
    add_index :user_tasks, :user_id
  end

end
