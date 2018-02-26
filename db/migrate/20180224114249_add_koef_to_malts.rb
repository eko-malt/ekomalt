class AddKoefToMalts < ActiveRecord::Migration[5.1]
  def change
    add_column :malts, :koef, :decimal
  end
end
