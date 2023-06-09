class Topic < ApplicationRecord
  has_many :user_topics, dependent: :destroy
  has_many :users, through: :user_topics, dependent: :destroy
  has_many :questions
end
