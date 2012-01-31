class Ticket < ActiveRecord::Base

  attr_accessible :comment

  validates :comment, presence: true

  def as_json(options = {})
    super({
      only: [:id, :comment]
    }.merge(options))
  end
end
