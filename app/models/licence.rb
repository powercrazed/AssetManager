class Licence < ActiveRecord::Base
  validates :vendor, :app_name, :version, :edition, presence: true
  validates_inclusion_of :in_use, in: [true, false]

  belongs_to :device, :inverse_of => :licences
  belongs_to :person, :inverse_of => :licences

  def app_full
    "#{app_name} #{version} #{edition}"
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      licence_hash = row.to_hash
      device = Device.where(name: licence_hash["device_name"])
      person = Person.where(first_name: licence_hash["first_name"], last_name: licence_hash["last_name"])
      # throw away device & person name columns after db lookups
      ["device_name", "first_name", "last_name"].each { |k| licence_hash.delete(k) }
      # add id's to licence hash, id's get set to nil if not found in db
      licence_hash[:device_id] = device.first.try(:id)
      licence_hash[:person_id] = person.first.try(:id)
      Licence.create! licence_hash
    end
  end
end
