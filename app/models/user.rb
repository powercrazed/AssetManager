class User < ActiveRecord::Base
  validates :first_name, :last_name, presence: true

  has_one :device, :inverse_of => :user
  has_many :licences, :foreign_key => 'user_id', :inverse_of => :user

  def full_name
    "#{first_name} #{last_name}"
  end
end
