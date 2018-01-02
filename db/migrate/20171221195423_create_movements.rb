class CreateMovements < ActiveRecord::Migration[5.1]
  def change
    create_table :movements do |t|
      t.decimal :amount
      t.references :sourceable, polymorphic: true, index: true
      t.references :targetable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
