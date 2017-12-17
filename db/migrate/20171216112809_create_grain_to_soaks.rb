class CreateGrainToSoaks < ActiveRecord::Migration[5.1]
  def change
    create_table :grain_to_soaks do |t|
      t.references :grain_input, foreign_key: true
      t.references :soak, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
