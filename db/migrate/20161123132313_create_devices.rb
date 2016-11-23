class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.integer :tag
      t.string :dev_type
      t.string :make
      t.string :model
      t.string :serial
      t.date :purchased_on
      t.integer :warranty_length
      t.string :warranty_type

      t.timestamps null: false
    end
  end
end
