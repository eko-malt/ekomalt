class CreateShipments < ActiveRecord::Migration[5.1]
  def change
    create_table :shipments do |t|
      t.references :order_item
      t.references :bag_batch
      t.date :date
      t.decimal :amount
    end
  end
end
