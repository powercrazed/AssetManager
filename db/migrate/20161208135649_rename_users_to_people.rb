class RenameUsersToPeople < ActiveRecord::Migration
  def change
    rename_table :users, :people

    remove_reference :devices, :user
    add_reference :devices, :person, index: true, foreign_key: true

    remove_reference :licences, :user
    add_reference :licences, :person, index: true, foreign_key: true
  end
end
