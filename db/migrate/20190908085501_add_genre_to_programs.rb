class AddGenreToPrograms < ActiveRecord::Migration[5.2]
  def change
    add_reference :programs, :genre, foreign_key: true
  end
end
