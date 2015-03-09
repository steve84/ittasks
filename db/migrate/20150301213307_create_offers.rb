class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.text :remark
      t.integer :amount

			t.references :task, index: true
			t.references :user, index: true

      t.timestamps null: false
    end
  end
end
