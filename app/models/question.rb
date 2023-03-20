class Question < ApplicationRecord
  belongs_to :user
  belongs_to :topic, optional: true
  has_many :answers, dependent: :destroy
end
