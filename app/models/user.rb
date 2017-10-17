class User < ApplicationRecord
  has_many :categorise
  has_many :tasks
  has_secure_password
  validates :address, uniqueness: true
end
