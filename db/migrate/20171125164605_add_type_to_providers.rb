class AddTypeToProviders < ActiveRecord::Migration[5.1]
  def change
    add_column :providers, :gtype, :integer
  end
end
