class CorrectFalseForeignKeys < ActiveRecord::Migration
  def change
		remove_foreign_key :tasks, column: :calculation_id
		remove_column :tasks, :calculation_id
		add_reference :calculations, :task
		add_foreign_key :calculations, :tasks
  end
end
