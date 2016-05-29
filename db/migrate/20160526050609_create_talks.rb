class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :title, null: false
      t.text :description, null: true
      t.integer :session_type, null: false, default: 0
      t.integer :day, null: false
      t.boolean :first_year_track, null: false, default: true
      t.boolean :alumna_track, null: false, default: false
      t.boolean :keynote, null: false, default: false
      t.timestamps null: false
    end
  end
end
