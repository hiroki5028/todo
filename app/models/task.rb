class Task < ApplicationRecord
  #Validation
  #title  length_100以内 必須
  validates :title, length:{ maximum: 100 }, presence: true

  #description  length_500以内
  validates :description, length:{ maximum: 500 }

  #importance  範囲 1~10
  validates :importance, inclusion:{ in: 1..10 }

  #expired_at 過去日はerrors
  validate :expired_at_validator

  #過去日判定メソッド（期限）
  def expired_at_validator
    if expired_at && expired_at < Time.zone.now
      errors.add(:expired_at, ": 過去の日時は使用できません")
    end
  end
end
