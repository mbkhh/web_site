class User < ApplicationRecord
    has_many :publications
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
    validates :name, presence: true
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
end