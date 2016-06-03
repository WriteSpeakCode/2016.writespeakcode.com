class AddStartTimeToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :start_time, :time
  end
end
