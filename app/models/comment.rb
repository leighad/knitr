class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :pattern

  validates :rating, presence: true
  validates :content, presence: true
end
