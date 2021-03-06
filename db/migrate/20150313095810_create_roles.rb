class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
		add_foreign_key :users, :roles
  end
end
