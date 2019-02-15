class User < ApplicationRecord

  validates :username, presence: true, length: {maximum: 12, minimum: 3}
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
end
