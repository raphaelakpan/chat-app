class Room < ApplicationRecord
  has_many :messages, dependent: :destroy, inverse_of: :room

  validates :name, uniqueness: true, presence: true
end
