class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.string  :video
      t.text   :text 
      t.timestamps
    end
  end
end
