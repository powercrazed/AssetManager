class AddUserToLicence < ActiveRecord::Migration
  def change
    add_reference :licences, :user, index: true, foreign_key: true
  end
end
