class CreateSoaks < ActiveRecord::Migration[5.1]
  def change
    create_table :soaks do |t|
      t.integer :status, default: 0
      t.integer :vat
      t.datetime :starttime
      t.datetime :finishtime

      t.timestamps
    end
  end
end
