class Order < ApplicationRecord
      attr_accessor :token
      has_one :addressbook
      belongs_to :user
      belongs_to :item
end
