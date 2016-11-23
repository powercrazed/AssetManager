class CreateLicences < ActiveRecord::Migration
  def change
    create_table :licences do |t|
      t.string :vendor
      t.string :app_name
      t.string :version
      t.string :edition
      t.string :channel
      t.string :purchased_from
      t.date :purchased_date

      t.timestamps null: false
    end
  end
end
