class Ticket < ApplicationRecord
  belongs_to :user, optional: true # ((1))
  belongs_to :event

  validates :comment, length: { maximum: 30 }, allow_blank: true # ((2))
end
