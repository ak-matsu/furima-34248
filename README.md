# テーブル情報

ユーザー情報:users
商品情報:items
購入記録:orders
発送先情報:deliveryaddress

# テーブル設計

## users テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |

## items テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| text   | string | null: false |
| image  | string | null: false |

## orders
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user   | references | null: false |
| order | references | null: false |

## deliveryaddress テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| address   | text | null: false |