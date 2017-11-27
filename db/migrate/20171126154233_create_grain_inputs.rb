class CreateGrainInputs < ActiveRecord::Migration[5.1]
  def change
    create_table :grain_inputs do |t|
      t.date :date
      t.references :provider, foreign_key: true
      t.decimal :weight_fact
      t.decimal :weight_doc
      t.decimal :price
      t.decimal :humidity
      t.integer :sprouting
      t.decimal :litter
      t.decimal :nature
      t.decimal :fall

      t.timestamps
    end
  end
end
