class CreateInputs < ActiveRecord::Migration[5.1]
  def change
    create_table :inputs do |t|
      t.date :date
      t.references :provider, foreign_key: true
      t.decimal :weightfact
      t.decimal :weightdoc
      t.decimal :price

      t.timestamps
    end
  end
end
