class CreateGrainBatches < ActiveRecord::Migration[5.1]
  def change
    create_table :grain_batches do |t|
      t.string :name
      t.decimal :amount
      t.references :raw_process, foreign_key: true
      t.references :malt, foreign_key: true
      t.decimal :correction, default: 0
      t.decimal :wet
      t.decimal :extravagance
      t.decimal :color
      t.integer :acidity
      t.integer :filtration

      t.timestamps
    end
  end
end
