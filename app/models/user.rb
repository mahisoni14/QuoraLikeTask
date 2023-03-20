class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions, dependent: :destroy
  has_many :user_topics, dependent: :destroy
  has_many :topics, through: :user_topics, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :followings
  has_many :following, :source => :following, :through => :followings
end
