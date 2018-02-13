class AddAmountToRawProcess < ActiveRecord::Migration[5.1]
  def change
    add_column :raw_processes, :amount, :decimal
  end
end
