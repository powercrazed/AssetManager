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
      Licence.create! licence_hash
    end
  end
end
