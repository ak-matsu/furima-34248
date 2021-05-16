FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    sei_zen               {'山'}
    mei_zen               {'田'}
    sei_kana              {'ヤマ'}
    mei_kana               {'ダ'}
    birthday              {'19680301'}
  end
end