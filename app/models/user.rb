class User < ApplicationRecord
  has_many :messages
  before_save { self.email = email.downcase }
  validates :username, presence: true,
                length: {maximum: 12, minimum: 3},
                uniqueness: true
  validates :email, presence: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
