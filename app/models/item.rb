class Item < ApplicationRecord
  with_options presence: true do
  validates :user
  validates :text
  validates :category_id
  validates :status_id
  validates :delivery_money_id
  validates :prefecture_id
  validates :delivery_day_id
  validates :price
  end

  belongs_to :user
  has_one_attached :image
end