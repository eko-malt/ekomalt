class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.decimal :grain_storage_capacity
      t.decimal :production_capacity
      t.decimal :malt_storage_capacity
      t.decimal :capital_coef

      t.decimal :soak1_capacity
      t.decimal :soak1_loading
      t.decimal :soak2_capacity
      t.decimal :soak2_loading

      t.decimal :thresh1_capacity
      t.decimal :thresh1_loading
      t.decimal :thresh2_capacity
      t.decimal :thresh2_loading
      t.decimal :thresh3_capacity
      t.decimal :thresh3_loading

      t.decimal :dryer_capacity
      t.decimal :dryer_loading

      t.decimal :fermenter1_capacity
      t.decimal :fermenter1_loading
      t.decimal :fermenter2_capacity
      t.decimal :fermenter2_loading
      t.decimal :fermenter3_capacity
      t.decimal :fermenter3_loading

      t.timestamps
    end
  end
end
