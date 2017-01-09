class Person < ActiveRecord::Base
  require 'csv'
  validates :first_name, :last_name, presence: true

  has_one :device, :inverse_of => :person
  has_many :licences, :foreign_key => 'person_id', :inverse_of => :person

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      person_hash = row.to_hash
      person = Person.where(first_name: person_hash["first_name"], last_name: person_hash["last_name"])

      # create if not in database
      if person.count == 0
        Person.create! person_hash
      end
    end
  end
end
