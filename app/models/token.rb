class Token < ApplicationRecord
  validates :auth_token, presence: true

  before_validation :set_token

  def self.generate!
    Token.create!
  end

  def self.verify(token)
    find_by(auth_token: token)
  end

  private

  def set_token
    self.auth_token = SecureRandom.alphanumeric(64)
  end
end
