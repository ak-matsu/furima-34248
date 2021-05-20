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

  belongs_to :category
  belongs_to :delivery_day
  belongs_to :delivery_money
  belongs_to :prefecture
  belongs_to :status

  has_one_attached :image
end