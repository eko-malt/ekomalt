class CreateBagInputs < ActiveRecord::Migration[5.1]
  def change
    create_table :bag_inputs do |t|
      t.date :date
      t.integer :amount
      t.integer :size
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
