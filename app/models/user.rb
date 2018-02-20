class User < ApplicationRecord
  has_many :articles

  validates :username, presence: true, length: { minimum: 4, maximum: 15 },
            uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false },
            length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
end
