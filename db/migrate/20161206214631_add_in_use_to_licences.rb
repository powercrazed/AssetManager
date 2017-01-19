class AddInUseToLicences < ActiveRecord::Migration
  def change
    add_column :licences, :in_use, :boolean
  end
end
