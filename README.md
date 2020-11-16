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

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| name           | string     | null: false |
| info           | text       | null: false |
| category       | integer    | null: false |
| condition      | integer    | null: false |
| price          | string     | null: false |
| active_storage |            |             |
| shipping       | integer    | null: false |
| prefecture     | integer    | null: false |
| delivery       | integer    | null: false |
| user           | references |             |
### Association

belongs_to : user
has_one : buyer

## buyers テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| user      | references |             |
| item      | references |             |

### Association

belongs_to : user
belongs_to : item
has_many : places

## places テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postal_code  | string     | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| address      | string     | null: false |
| building     | string     | null: false |
| phone_number | string     | null: false |
| buyer        | reference  |             |

### Association

belongs_to : buyer