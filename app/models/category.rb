class Category < ApplicationRecord
  has_many :tasks
  belongs_to :users
  #Validation
  #title  length_100以内 必須
  validates :title, length:{ maximum: 100 }, presence: true, uniqueness: true
end
