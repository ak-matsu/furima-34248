class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
      validates :sei_zen
      validates :mei_zen
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :sei_kana
      validates :mei_kana
    end
  end

  # 英数字以外の文字が混ざっていれば登録できないように正規表現
  validates :password, :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/ }

end
