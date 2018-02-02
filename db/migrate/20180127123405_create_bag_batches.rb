class CreateBagBatches < ActiveRecord::Migration[5.1]
  def change
    create_table :bag_batches do |t|
      t.date :shredded
      t.string :batch
      t.references :malt, foreign_key: true
      t.integer :bag_type
      t.decimal :wet
      t.decimal :extravagance
      t.decimal :color
      t.integer :acidity
      t.integer :filtration

      t.timestamps
    end
  end
end
