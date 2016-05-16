class Snippet < ActiveRecord::Base
  belongs_to :user
  validates :code, presence: true
  before_create :create_token
  default_scope -> { order(created_at: :desc) }

  # Returns title or date (to have no untitled snippets)
  def title
    read_attribute(:title).presence || created_at.strftime("%d %B %Y, %H:%M")
  end

  # Creates urlsafe string of 10 characters.
  def self.new_token
    SecureRandom.urlsafe_base64(7)
  end

  # Generates URLs with tokens instead of ids
  def to_param
    token
  end

  private

  # Creates a token for the new snippet before saving
  def create_token
    self.token = Snippet.new_token
  end
end
