class Device < ActiveRecord::Base
  validates :tag, :name, presence: true, uniqueness: true

  belongs_to :person, :inverse_of => :device
  has_many :licences, :foreign_key => 'device_id', :inverse_of => :device

  def tag_formatted
    "%04d" % tag
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      device_hash = row.to_hash
      device = Device.where(name: device_hash["name"])

      # create if not in database
      if device.count == 0
        Device.create! device_hash
      end
    end
  end
end
