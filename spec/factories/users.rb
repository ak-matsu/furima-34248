FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'00000000'}
    password_confirmation {password}
    sei_zen               {'山'}
    mei_zen               {'田'}
    sei_kana              {'ヤマ'}
    mei_kana               {'ダ'}
    birthday              {'19680301'}
  end
end