class CreateRawProcesses < ActiveRecord::Migration[5.1]
  def change
    create_table :raw_processes do |t|
      t.references :equipment, foreign_key: true
      t.datetime :start_time
      t.datetime :finish_time
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
