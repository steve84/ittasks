class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :duration

			t.references :principal, index: true
			t.references :agent, index: true
			t.references :location, index: true
			t.references :calculation, index: true
			t.references :rating, index: true

      t.timestamps null: false
    end
  end
end
