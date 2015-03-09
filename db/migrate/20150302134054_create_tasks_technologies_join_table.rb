class CreateTasksTechnologiesJoinTable < ActiveRecord::Migration
  def change
		create_table :tasks_technologies, id: false do |t|
			t.integer :task_id
			t.integer :technology_id
		end

		add_index :tasks_technologies, :task_id
		add_index :tasks_technologies, :technology_id
  end
end
