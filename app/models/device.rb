class Device < ActiveRecord::Base
  validates :tag, :name, presence: true, uniqueness: true

  belongs_to :user, :inverse_of => :device
  has_many :licences, :foreign_key => 'device_id', :inverse_of => :device

  def tag_formatted
    "%04d" % tag
  end
end
