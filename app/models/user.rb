class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :sei_zen,format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :mei_zen,format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :sei_kana,format: {with: /\A[ァ-ヶー－]+\z/}
    validates :mei_kana,format: {with: /\A[ァ-ヶー－]+\z/}
    validates :birthday
  end
  validates :encrypted_password,:password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}

end