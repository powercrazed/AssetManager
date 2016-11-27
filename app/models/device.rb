class Device < ActiveRecord::Base
  validates :tag, :name, presence: true, uniqueness: true

  has_many :licences, :foreign_key => 'device_id', :inverse_of => :device
end
