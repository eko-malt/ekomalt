class AddSortToMalt < ActiveRecord::Migration[5.1]
  def change
    add_column :malts, :sort, :integer
  end
end
