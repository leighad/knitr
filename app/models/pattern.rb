class Pattern < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments

  scope :alpha, -> { order (:pattern_name) }

  validates :pattern_name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :level, presence: true
  validates :instructions, presence: true
end
