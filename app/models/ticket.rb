class Ticket < ActiveRecord::Base

  attr_accessible :comment

  has_many :subscriptions
  has_many :subscribers, through: :subscriptions

  validates :comment, presence: true, length: { maximum: 65536 }

  def as_json(options = {})
    super({
      only: [:id, :comment, :created_at, :updated_at]
    }.merge(options))
  end

  def find_or_create_subscriber(email)
    unless email.blank?
      subscribers.find_or_create_by_email(email.strip.downcase)
    end
  end
end
