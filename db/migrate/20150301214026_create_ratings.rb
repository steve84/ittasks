class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.float :value
      t.text :remark

			t.references :task, index: true

      t.timestamps null: false
    end
  end
end
