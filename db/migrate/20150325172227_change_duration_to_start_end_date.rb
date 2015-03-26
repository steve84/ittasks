class ChangeDurationToStartEndDate < ActiveRecord::Migration
  def change
		remove_column :tasks, :duration
		add_column :tasks, :start, :date
		add_column :tasks, :end, :date
  end
end
