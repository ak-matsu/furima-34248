class Order < ApplicationRecord
  has_one :addressbook
  belongs_to :user
  belongs_to :item
end
