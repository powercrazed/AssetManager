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
        person = Person.where(first_name: device_hash["first_name"], last_name: device_hash["last_name"])
        # throw away person name columns after db lookup
        ["first_name", "last_name"].each { |k| device_hash.delete(k) }
        # add person_id to device hash, id gets set to nil if not found in db
        device_hash[:person_id] = person.first.try(:id)
        Device.create! device_hash
      end
    end
  end
end
