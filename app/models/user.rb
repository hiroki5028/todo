class User < ApplicationRecord
  has_secure_password
  validates :address, uniqueness: true
end
