class CreateEquipment < ActiveRecord::Migration[5.1]
  def change
    create_table :equipment do |t|
      t.integer :eqtype
      t.string :name
      t.integer :maltose
      t.decimal :capacity
      t.decimal :service_time
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
