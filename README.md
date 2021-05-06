# テーブル情報

ユーザー情報:users
商品情報:items
購入記録:orders
発送先情報:deliveryaddress

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
| kakaku | string | null: false |


## orders
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user   | references | null: false |
| order | references | null: false |

## deliveryaddress テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| address   | text | null: false |