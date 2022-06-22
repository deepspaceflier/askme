class Question < ApplicationRecord
  validates :body, presence: true, length: { maximum: 280 }, format: { with: /^[\w ,.!?]+$/, multiline: true }
end
