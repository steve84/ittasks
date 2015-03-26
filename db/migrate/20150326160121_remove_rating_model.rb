class RemoveRatingModel < ActiveRecord::Migration
  def change
		remove_foreign_key :tasks, column: :rating_id
		remove_column :tasks, :rating_id
		remove_foreign_key :ratings, column: :task_id
		remove_column :ratings, :task_id
  end
end
