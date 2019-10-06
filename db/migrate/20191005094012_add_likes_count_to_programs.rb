class AddLikesCountToPrograms < ActiveRecord::Migration[5.2]
  def change
    add_column :programs, :likes_count, :integer
  end
end
