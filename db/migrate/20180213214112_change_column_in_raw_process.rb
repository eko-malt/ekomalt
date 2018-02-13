class ChangeColumnInRawProcess < ActiveRecord::Migration[5.1]
  def change
    rename_column :raw_processes, :amount, :current_weight
  end
end
