# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false ,unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |
  
### Association

- has_many :items
- has_many :purchase_historys

## items テーブル

| Column               | Type       | Options                        |
| ---------------------| ---------- | -------------------------------|
| name                 | string     | null: false                    |
| description          | text       | null: false                    |
| category_id          | integer    | null: false                    |
| item_status_id       | integer    | null: false                    |
| shipping_charges_id  | integer    | null: false                    |
| shipping_area_id     | integer    | null: false                    |
| days_to_ship_id      | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- has_one    :purchase_history
- belongs_to :user

## purchase_histories テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- has_one    :destination
- belongs_to :user
- belongs_to :item


## destinations テーブル

| Column                | Type       | Options                        |
| ----------------------| ---------- | -------------------------------|
| postal_code           | string     | null: false                    |
| shipping_area_id      | integer    | null: false                    |
| city                  | string     | null: false                    |
| address               | string     | null: false                    |
| building_name         | string     |                                |
| phone_number          | string     | null: false                    |
| purchase_history      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_history

