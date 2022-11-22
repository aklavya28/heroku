class User < ApplicationRecord
  before_save { self.email = email.downcase }
  # has_many :articles, dependent: :destroy
  has_many :blogs, dependent: :destroy
  validates :username, presence: true,
            length: {minimum:5, maximum:15},
            uniqueness: { case_sensitive: false }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: {minimum:3, maximum:25},
              uniqueness: { case_sensitive: false },
              format: { with: VALID_EMAIL_REGEX }

  has_secure_password
end
