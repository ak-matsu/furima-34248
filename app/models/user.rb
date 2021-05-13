class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :sei_zen,presence: true
  validates :mei_zen,presence: true
  validates :sei_kana,presence: true
  validates :mei_kana,presence: true
  validates :birthday,presence: true
end