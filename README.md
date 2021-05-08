# テーブル情報

- ユーザー情報:users  
- 商品出品:items   
- 購入管理:orders  
- 配送先住所:address_books  

has_manyメソッド  
1:n  
belongs_toメソッド  
n:n
has_oneメソッド
1:1

オプション	役割  
null: false	カラムが空の状態では保存できない  
unique: true	一意性のみ許可（同じ値は保存できない）  
foreign_key: true	外部キーを設定（別テーブルのカラムを参照する）  
unique: true 一意性制約  
  
references型  
外部キーを追加するときに指定します。  
例えばt.references :userと指定すると  user_idというカラムが追加されます。  
ただしこれだけでは外部キー制約がつかないので下記のようにforeign_key: trueを記述します。  
  
ActiveHash  
Active_Hashとは、都道府県名などの変更されないデータを  
モデルファイル内に直接記述することで、  
データベースへ保存せずにデータを取り扱うことができるGemです。  
  
_id  
  user_idは、usersテーブルのidが主キーであり、  
  関連性を持つ場合に必要なカラムです。  
  
# テーブル設計

## users テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false unique: true |
| encrypted_password | string | null: false |
| sei_zen | string | null: false |
| mei_zen | string | null: false |
| sei_kana | string | null: false |
| mei_kana | string | null: false |
| birthday | date | null: false |

### Association

- has_many :orders
- has_many :items

## items テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user   | references | foreign_key: true	 |
| name   | string | null: false |
| text   | text | null: false |
| category_id | integer | null: false |
| status_id | integer | null: false |
| delivery_money_id | integer | null: false |
| address_id | integer | null: false |
| delivery_day_id | integer | null: false |
| price | integer | null: false |

### Association
 - belongs_to :user
 - has_one :order

## orders
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user   | references | foreign_key: true	 |
| item | references | foreign_key: true	 |

### Association

- has_one :address_book
- belongs_to :user
- belongs_to :item

## address_books
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| order_id | references | foreign_key: true	 |
| post_num | string | null: false |
| prefecture_id | integer | null: false |
| city | string | null: false |
| banchi | string | null: false |
| tower | string |  |
| phone | string | null: false |

### Association
- belongs_to :order