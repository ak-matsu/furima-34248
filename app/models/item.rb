class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

    with_options presence: true do
      validates :text
      validates :price
    
      #ジャンルの選択が「--」の時は保存できないようにする
      with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :status_id
        validates :delivery_money_id
        validates :prefecture_id
        validates :delivery_day_id
      end
    end

  belongs_to :category
  belongs_to :deliveryday
  belongs_to :deliverymoney
  belongs_to :prefecture
  belongs_to :status
  belongs_to :user

  # 1:1 itemとimageテーブル
  has_one_attached :image
  
end