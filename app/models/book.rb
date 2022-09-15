class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :image
 validates :title, presence: true
  validates :body, presence: true
  validates :body,:title, presence: true
  validates :body, length: { in: 1..200 }
end
