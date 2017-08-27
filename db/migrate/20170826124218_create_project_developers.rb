class CreateProjectDevelopers < ActiveRecord::Migration
  def change
    create_table :project_developers do |t|
      t.integer :project_id
      t.integer	:user_id
      t.timestamps
    end
    add_index :project_developers, :project_id
    add_index :project_developers, :user_id
  end
end
