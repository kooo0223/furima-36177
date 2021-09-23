# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| year_of_birth      | date   | null: false |
| month_of_birth     | date   | null: false |
| date_of_birth      | date   | null: false |

### Association
- has_many :items
- has_many :records

## items テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| product       | string     | null: false                    |
| category      | text       | null: false                    |
| price         | integer    | null: false                    |
| condition     | text       | null: false                    |
| delivery_fee  | integer    | null: false                    |
| area          | string     | null: false                    |
| shipment      | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to: user
- has_one: records

## records テーブル

| Column   | Type       | Options                        |
| ---------| ---------- | ------------------------------ |
| items    | references | null: false, foreign_key: true |
| users    | references | null: false, foreign_key: true |

### Association
- belongs_to: user
- belongs_to: item
- belongs_to: address

## addresses テーブル

| Column        | Type       | Options       |
| --------------| ---------- | ------------- |
| postal_code   | text       | null: false   |
| state         | string     | null: false   |
| city          | string     | null: false   |
| address_line  | string     | null: false   |
| building      | string     |               |
| phone_number  | string     | null: false   |

### Association
- has_many: records