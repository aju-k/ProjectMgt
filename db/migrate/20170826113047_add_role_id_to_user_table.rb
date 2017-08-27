class AddRoleIdToUserTable < ActiveRecord::Migration
  def change
  	add_column :users, :role_id, :integer, default: DEVELOPER_ROLE
  	add_index :users, :role_id
  end
end
