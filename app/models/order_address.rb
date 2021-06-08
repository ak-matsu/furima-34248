class OrderAddress

  include ActiveModel::Model
  # orderテーブルとaddressbookテーブルに保存したいカラム名を指定
  attr_accessor :postnum,:prefecture_id,:city,:banchi,:tower,:phone,:user_id,:item_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    
    # カード情報
    validates :
    # 有効期限

    # セキュリティコード4桁

    # 配送先住所
    # 郵便番号
    validates :postnum, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

    # 市町村
    validates :city

    # 番地
    validates :banchi

    # 建物名
    validates :tower

    # 電話番号
    validates :phone

  def save
    # 寄付情報を保存し、変数donationに代入する
    order = order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Addressbooks.create(order: order, postnum: postnum, prefecture_id: prefecture_id, city: city, banchi: banchi, tower: tower, phone: phone)
  end
end