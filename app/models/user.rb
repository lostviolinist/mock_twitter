class User < ApplicationRecord
    before_save { self.email = email.downcase }
    has_many :posts
    validates :name, presence: true, length: { maximum: 100}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 100}, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
    validates :password, presence: true, length: {minimum: 6 }
    has_secure_password
end
