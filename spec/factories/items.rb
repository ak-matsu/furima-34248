FactoryBot.define do
  factory :item do
    # イメージ
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))}
    # 商品名
    name                { Faker::Commerce.product_name}
    # 商品の説明

    # カテゴリー

    # 商品の状態

    # 配送料の負担

    # 販売元の地域

    # 発送までの日数

    # 価格

  end
end


FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    sei_zen               { '山' }
    mei_zen               { '田' }
    sei_kana              { 'ヤマ' }
    mei_kana { 'ダ' }
    birthday { '19680301' }
  end
end