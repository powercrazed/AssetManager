class AddDeviceToLicence < ActiveRecord::Migration
  def change
    add_reference :licences, :device, index: true, foreign_key: true
  end
end
