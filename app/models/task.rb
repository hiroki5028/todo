class Task < ApplicationRecord
  #Validation
  #title  length_100以内 必須
  validates :title, length:{ maximum: 100 }, presence: true

  #description  length_500以内
  validates :description, length:{ maximum: 500 }

  #importance  範囲 1~10
  validates :importance, inclusion:{ in: 1..10 }
end
