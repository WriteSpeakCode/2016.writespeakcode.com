class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: true
      t.boolean :mentor, null: false, default: false
      t.boolean :organizer, null: false, default: false
      t.timestamps null: false
    end
  end
end
