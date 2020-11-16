# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| -------------------| ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nick_name          | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many : items
- has_many : buyers

## items テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| name           | string     | null: false       |
| info           | text       | null: false       |
| category_id    | integer    | null: false       |
| condition_id   | integer    | null: false       |
| price_id       | integer    | null: false       |
| shipping_id    | integer    | null: false       |
| prefecture_id  | integer    | null: false       |
| delivery_id    | integer    | null: false       |
| user           | references | foreign_key: true |
### Association

belongs_to : user
has_one : buyer

## buyers テーブル

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |

### Association

belongs_to : user
belongs_to : item
has_many : places

## places テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| address       | string     | null: false       |
| building      | string     |                   |
| phone_number  | string     | null: false       |
| buyer         | reference  | foreign_key: true |

### Association

belongs_to : buyer