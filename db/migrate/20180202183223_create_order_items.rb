class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :malt, foreign_key: true
      t.integer :bag
      t.integer :amount

      t.timestamps
    end
  end
end
