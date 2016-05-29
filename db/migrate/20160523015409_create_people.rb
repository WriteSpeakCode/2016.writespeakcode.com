class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: true

      t.text :bio, null: true
      t.string :pronouns, null: false, default: 'she/her'
      t.string :image_filename, null: true

      t.string :twitter, null: true
      t.string :website, null: true
      t.string :linkedin, null: true
      t.string :github, null: true

      t.string :job_title, null: true
      t.string :company, null: true

      t.boolean :mentor, null: false, default: false
      t.boolean :organizer, null: false, default: false

      t.boolean :display, null: false, default: false

      t.timestamps null: false
    end
  end
end
