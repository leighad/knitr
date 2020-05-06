class User < ApplicationRecord
    has_secure_password 
    has_many :patterns
    has_many :comments
    has_many :commented_patterns, through: :comments, source: :pattern 
end
