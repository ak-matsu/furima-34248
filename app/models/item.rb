class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :text
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is out of setting range' }
    validates :image
    validates :name

    # ジャンルの選択が「--」の時は保存できないようにする
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_money_id
      validates :prefecture_id
      validates :delivery_day_id
    end
  end

  belongs_to :category
  belongs_to :delivery_day
  belongs_to :delivery_money
  belongs_to :prefecture
  belongs_to :status
  belongs_to :user

  # 1:1 itemとimageテーブル
  has_one_attached :image

  # 1:1 itemとorderテーブル
  has_one :order
end
