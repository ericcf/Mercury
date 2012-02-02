class Subscription < ActiveRecord::Base

  attr_accessible :ticket, :ticket_id, :subscriber, :subscriber_id

  belongs_to :ticket
  belongs_to :subscriber

  validates :ticket, :subscriber, presence: true
  validates_uniqueness_of :ticket_id, scope: :subscriber_id
end
