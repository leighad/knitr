class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :pattern

  scope :alpha, -> { order (:pattern_name) }
  scope :top_rated, -> { where ("(rating) = 5") }
  scope :most_recent, -> { order ("created_at desc") }

  validates :rating, presence: true
  validates :content, presence: true, length: { maximum: 80 }
end
