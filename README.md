# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| ----------------| ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nick_name       | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | string | null: false |

### Association

- has_many : items
- has_many : buyers

## items テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| item_name       | string     | null: false |
| item_info       | text       | null: false |
| item_category   | string     | null: false |
| item_condition  | text       | null: false |
| item_price      | string     | null: false |
| item_image      |            |             |
| item_shipping   | string     | null: false |
| item_prefecture | string     | null: false |
| item_delivery   | string     | null: false |

### Association

belongs_to : user
has_one : buyer
has_many : places

## buyers テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| user      | references |             |
| prototype | references |             |

### Association

belongs_to : user
belongs_to : prototype

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| card_number    | string     | null: false |
| card_exp_month | string     | null: false |
| card_exp_year  | string     | null: false |
| card_cvc       | string     | null: false |
| postal_code    | string     | null: false |
| prefecture     | string     | null: false |
| city           | string     | null: false |
| address        | string     | null: false |
| building       | string     | null: false |
| phone_number   | string     | null: false |

### Association

belongs_to : item