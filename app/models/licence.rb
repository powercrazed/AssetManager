class Licence < ActiveRecord::Base
  validates :vendor, :app_name, :version, :edition, presence: true

  belongs_to :device, :inverse_of => :licences
  belongs_to :user, :inverse_of => :licences
end
