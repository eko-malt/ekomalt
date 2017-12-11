class AddRemainderToGrainInputs < ActiveRecord::Migration[5.1]
  def change
    add_column :grain_inputs, :remainder, :integer
  end
end
