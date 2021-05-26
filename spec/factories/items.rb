FactoryBot.define do
  factory :item do
    # イメージ

    # ID
    id               { 1 }
    user_id            {1}
    # 商品名
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