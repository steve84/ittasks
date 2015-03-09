class CreateCalculations < ActiveRecord::Migration
  def change
    create_table :calculations do |t|
      t.float :amount
      t.string :state

      t.timestamps null: false
    end
  end
end
