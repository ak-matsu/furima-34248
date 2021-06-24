class OrderAddress
  include ActiveModel::Model
  # orderテーブルとaddressbookテーブルに保存したいカラム名を指定
  attr_accessor :token,:postnum, :prefecture_id, :city, :banchi, :tower, :phone, :user_id, :item_id

  # ここにバリデーションの処理を書く

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postnum, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Postnum can't be blank" }
    validates :city
    validates :banchi
    validates :phone,format: { with: /\A0[5789]0\d{4}\d{4}\z/} 
    
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    # binding.pry
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Addressbook.create(order_id: order.id, postnum: postnum, prefecture_id: prefecture_id, city: city, banchi: banchi,tower: tower, phone: phone)
  end
end
