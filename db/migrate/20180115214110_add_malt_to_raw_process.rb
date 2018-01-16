class AddMaltToRawProcess < ActiveRecord::Migration[5.1]
  def change
    add_reference :raw_processes, :malt, foreign_key: true
  end
end
