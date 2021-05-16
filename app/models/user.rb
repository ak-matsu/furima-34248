class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
      validates :sei_zen
      validates :mei_zen
    end

    with_options format: {with: /\A[ァ-ヶー－]+\z/}
      validates :sei_kana
      validates :mei_kana
    end
  end
  
  validates :encrypted_password,:password,:password_confirmation,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}

end