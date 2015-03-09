class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :tasks, :users, column: :principal_id 
    add_foreign_key :tasks, :users, column: :agent_id
    add_foreign_key :tasks, :locations
    add_foreign_key :tasks, :calculations
    add_foreign_key :tasks, :ratings

    add_foreign_key :offers, :tasks
    add_foreign_key :offers, :users

		add_foreign_key :users, :locations

		add_foreign_key :questions, :tasks

		add_foreign_key :ratings, :tasks
  end
end
