class AddRemainderToBagInputs < ActiveRecord::Migration[5.1]
  def change
    add_column :bag_inputs, :remainder, :integer
  end
end
