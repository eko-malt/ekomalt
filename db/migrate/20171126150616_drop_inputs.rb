class DropInputs < ActiveRecord::Migration[5.1]
  def change
    drop_table :inputs
  end
end
