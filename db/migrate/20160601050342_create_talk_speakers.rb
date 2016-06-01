class CreateTalkSpeakers < ActiveRecord::Migration
  def change
    create_table :talk_speakers do |t|
      t.references :talk, null: false
      t.references :person, null: false
      t.integer :order, null: false, default: 0
      t.integer :speaker_role, null: false, default: 0
      t.timestamps null: false
    end
  end
end
