class Subscriber < ActiveRecord::Base

  attr_accessible :email

  validates :email,
            presence: true,
            length: { maximum: 255 },
            uniqueness: true
end
