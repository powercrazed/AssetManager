class Licence < ActiveRecord::Base
  validates :vendor, :app_name, :version, :edition, presence: true
  validates_inclusion_of :in_use, in: [true, false]

  belongs_to :device, :inverse_of => :licences
  belongs_to :person, :inverse_of => :licences

  def app_full
    "#{app_name} #{version} #{edition}"
  end
end
