class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday


      validates :sei_zen,format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
      validates :mei_zen,format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
      validates :sei_kana,format: {with: /\A[ァ-ヶー－]+\z/}
      validates :mei_kana,format: {with: /\A[ァ-ヶー－]+\z/}

  end

  validates :encrypted_password,:password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}

end