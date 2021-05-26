FactoryBot.define do
  factory :item do
    # イメージ
    # image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))}
    # 商品名
    #  id               { Faker::IDNumber.croatian_id }
    user_id            {1}
    name                { Faker::Commerce.product_name}
    # 商品の説明
    text                {Faker::Commerce.department}
    
    # カテゴリー
    category_id         {1}

    # 商品の状態
    status_id           {1}

    # 配送料の負担
    delivery_money_id   {100}

    # 販売元の地域
    prefecture_id       {1}

    # 発送までの日数
    delivery_day_id     {1}

    # 価格
    price             {300}

  end
end


# FactoryBot.define do
#   factory :user do
#     nickname { Faker::Name.initials(number: 2) }
#     email                 { Faker::Internet.free_email }
#     password              { '1a' + Faker::Internet.password(min_length: 6) }
#     password_confirmation { password }
#     sei_zen               { '山' }
#     mei_zen               { '田' }
#     sei_kana              { 'ヤマ' }
#     mei_kana { 'ダ' }
#     birthday { '19680301' }
#   end
# end