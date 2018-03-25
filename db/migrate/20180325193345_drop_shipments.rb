class DropShipments < ActiveRecord::Migration[5.1]
  def change
    drop_table :shipments
  end
end
