class User < ApplicationRecord
    has_secure_password 
    has_many :patterns
    has_many :comments
    has_many :commented_patterns, through: :comments, source: :pattern 

    validates :username, presence: true, uniqueness: true, length: { minimum: 2 }
    validates :email, presence: true, uniqueness: true

    def self.find_or_create_by_google(auth)
        self.find_or_create_by(email: auth[:info][:email]) do |user|
            user.password = SecureRandom.hex(12)
            user.username = auth[:info][:first_name]
        end
    end
end
