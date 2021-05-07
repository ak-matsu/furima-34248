# テーブル情報

- ユーザー情報:users  
- 商品出品:items   
- 購入記録:orders  


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
| email    | string | null: false |
| password | string | null: false |
| name-zen | string | null: false |
| name-kana | string | null: false |
| birthday | string | null: false |

### Association

- has_many :orders
- has_one :items

## items テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image  | string | null: false |
| name   | string | null: false |
| text   | text | null: false |
| category | string | null: false |
| status | string | null: false |
| deliverymoney | string | null: false |
| address | string | null: false |
| deliveryday | string | null: false |
| kakaku | money | null: false |

### Association
 - belongs_to :user
 - has_one :orders

## orders
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user   | references | foreign_key: true	 |
| item | references | foreign_key: true	 |
| address   | text | null: false |

### Association

- belongs_to :users
- belongs_to :items