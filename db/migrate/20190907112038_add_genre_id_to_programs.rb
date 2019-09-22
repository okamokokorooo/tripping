class AddGenreIdToPrograms < ActiveRecord::Migration[5.2]
  def change
    add_column :programs, :genre_id, :integer, null:false
  end
end
