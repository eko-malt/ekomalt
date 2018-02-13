class CreateShipments < ActiveRecord::Migration[5.1]
  def change
    create_table :shipments do |t|
      t.date :date
      t.references :client
      t.references :order
      t.references :bag_batch
      t.decimal :amount

      t.timestamps
    end
  end
end
