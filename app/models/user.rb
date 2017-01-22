class User < ApplicationRecord
  has_many :products
  validates :email, uniqueness:{ case_sensitive: false }, length: 2..25
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password, confirmation: true
  validates :username,presence: true, length: 2..15
  has_secure_password
end
