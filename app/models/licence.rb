class Licence < ActiveRecord::Base
  validates :vendor, :app_name, :version, :edition, presence: true
end
