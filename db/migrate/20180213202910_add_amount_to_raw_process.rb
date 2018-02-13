class AddAmountToRawProcess < ActiveRecord::Migration[5.1]
  def change
    add_column :raw_processes, :current_weight, :decimal
  end
end
