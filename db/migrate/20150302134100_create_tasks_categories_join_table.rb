class CreateTasksCategoriesJoinTable < ActiveRecord::Migration
  def change
		create_table :categories_tasks, id: false do |t|
			t.integer :task_id
			t.integer :category_id
		end

		add_index :categories_tasks, :task_id
		add_index :categories_tasks, :category_id
  end
end
