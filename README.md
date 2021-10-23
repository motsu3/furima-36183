# テーブル設計

## users テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| nickname              | string     | null: false                    |
| email                 | string     | null: false                    |
| encrypted_password    | string     | null: false                    |
| last_name             | string     | null: false                    |
| first_name            | string     | null: false                    |
| last_name_kana        | string     | null: false                    |
| first_name_kana       | string     | null: false                    |
| birthday              | integer    | null: false                    |

### アソシエーション

- has_many :items
- has_one  :address
- has_one  :card



## itemsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| introduction          | text       | null: false                    |
| category              | string     | null: false                    |
| condition             | string     | null: false                    |
| delivery_fee          | integer    | null: false                    |
| shipping_area         | string     | null: false                    |
| shipping_days         | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user_id               | references | null: false, foreign_key: true |

### アソシエーション

- belongs_to :user





## addressesテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| postal_code           | integer    | null: false                    |
| prefecture            | string     | null: false                    |
| city                  | string     | null: false                    |
| address_detail        | string     | null: false                    |
| building_name         | string     |                                |
| phone_number          | string     | null: false                    |
| user_id               | references | null: false, foreign_key: true |

### アソシエーション

- belongs_to :user





## cardsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| card_id               | string     | null: false                    |
| expiration_month      | integer    | null: false                    |
| expiration_year       | integer    | null: false                    |
| security_code         | integer    | null: false                    |
| user_id               | references | null: false, foreign_key: true |

### アソシエーション

- belongs_to :user