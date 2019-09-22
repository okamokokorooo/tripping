class RemoveGenreIdToPrograms < ActiveRecord::Migration[5.2]
  def change
    remove_column :programs, :genre_id, :integer, null:false
  end
end
