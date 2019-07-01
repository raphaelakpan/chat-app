class Message < ApplicationRecord
  belongs_to :room, inverse_of: :messages
  belongs_to :user

  validates :message, presence: true
end
