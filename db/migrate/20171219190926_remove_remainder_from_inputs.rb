class RemoveRemainderFromInputs < ActiveRecord::Migration[5.1]
  def change
    remove_column :grain_inputs, :remainder
    remove_column :bag_inputs, :remainder
  end
end
