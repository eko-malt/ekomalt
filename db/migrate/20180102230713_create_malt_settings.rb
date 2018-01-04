class CreateMaltSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :malt_settings do |t|
      t.references :malt, foreign_key: true
      t.references :equipment, foreign_key: true
      t.integer :duration, default: 1
      t.integer :available, default: 1

      t.timestamps
    end
  end
end