class Device < ActiveRecord::Base
  validates :tag, :name, presence: true, uniqueness: true

end
