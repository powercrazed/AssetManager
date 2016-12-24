class Person < ActiveRecord::Base
  validates :first_name, :last_name, presence: true

  has_one :device, :inverse_of => :person
  has_many :licences, :foreign_key => 'person_id', :inverse_of => :person

  def full_name
    "#{first_name} #{last_name}"
  end
end
