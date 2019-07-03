class Message < ApplicationRecord
  belongs_to :room, inverse_of: :messages
  belongs_to :user

  validates :message, presence: true

  def as_json(options = nil)
    super(options).merge(
      created_at: created_at.strftime("%A, %d %b %Y %l:%M %p"),
      user_username: user.username,
      user_avatar_url: user.gravatar_url
    )
  end
end
