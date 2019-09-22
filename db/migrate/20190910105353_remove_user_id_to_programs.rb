class RemoveUserIdToPrograms < ActiveRecord::Migration[5.2]
  def change
    remove_column :programs, :user_id, :references, null:false
  end
end
