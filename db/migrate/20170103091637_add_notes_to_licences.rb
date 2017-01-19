class AddNotesToLicences < ActiveRecord::Migration
  def change
    add_column :licences, :notes, :text
  end
end
