class OrderAddress

  include ActiveModel::Model
  # orderテーブルとaddressbookテーブルに保存したいカラム名を指定
  attr_accessor :

  # ここにバリデーションの処理を書く

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end