class OrderAddress
  include ActiveModel::Model
  # orderテーブルとaddressbookテーブルに保存したいカラム名を指定
  attr_accessor :postnum,:prefecture_id,:city,:banchi,:tower,:phone,:user_id,:item_id
  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :postnum, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 寄付情報を保存し、変数orderに代入する
    order = order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Addressbooks.create(order: order, postnum: postnum, prefecture_id: prefecture_id, city: city, banchi: banchi, tower: tower, phone: phone)
  end
end