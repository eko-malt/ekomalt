class Cleanup < ActiveRecord::Migration[5.1]
  def change
    drop_table :grain_to_soaks
    drop_table :soaks
  end
end
