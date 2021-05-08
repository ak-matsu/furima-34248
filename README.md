# テーブル情報

- ユーザー情報:users  
- 商品出品:items   
- 購入記録:orders  
- 配送先住所:address-books  

has_manyメソッド  
1:n  
belongs_toメソッド  
n:n
has_onnメソッド
1:1

オプション	役割  
null: false	カラムが空の状態では保存できない  
unique: true	一意性のみ許可（同じ値は保存できない）  
foreign_key: true	外部キーを設定（別テーブルのカラムを参照する）  

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
| name   | string | null: false |
| text   | text | null: false |
| category | string | null: false |
| status | string | null: false |
| delivery_money | string | null: false |
| address | string | null: false |
| delivery_day | string | null: false |
| price | money | null: false |

### Association
 - belongs_to :user
 - has_one :order

## orders
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user   | references | foreign_key: true	 |
| item | references | foreign_key: true	 |

### Association

- has_one :address-book
- belongs_to :user
- belongs_to :item

## address-books
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| city | string | null: false |
| banchi | int | null: false |
| tower-num | int | null: false |
| post-num | int | null: false |
| Phone | int | null: false |

### Association

- belongs_to :order
