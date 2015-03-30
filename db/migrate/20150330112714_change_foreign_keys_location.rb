class ChangeForeignKeysLocation < ActiveRecord::Migration
  def change
		remove_foreign_key :tasks, column: :location_id
		remove_column :tasks, :location_id
		remove_foreign_key :users, column: :location_id
		remove_column :users, :location_id
		add_reference :locations, :resident, polymorphic: true, index: true
  end
end
