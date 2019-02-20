class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: { minimum: 1, maximum: 255}
  validates_presence_of :user

  scope :custom_display, -> { order(:created_at).last(17)}
end
