# テーブル設計

## users テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| nickname              | string     | null: false                    |
| email                 | string     | null: false, unique: true      |
| encrypted_password    | string     | null: false                    |
| last_name             | string     | null: false                    |
| first_name            | string     | null: false                    |
| last_name_kana        | string     | null: false                    |
| first_name_kana       | string     | null: false                    |
| birthday              | date       | null: false                    |

### アソシエーション

- has_many :items
- has_many  :cards



## itemsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| introduction          | text       | null: false                    |
| category_id           | integer    | null: false                    |
| condition_id          | integer    | null: false                    |
| delivery_fee_id       | integer    | null: false                    |
| shipping_area_id      | integer    | null: false                    |
| shipping_days_id      | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### アソシエーション

- belongs_to :user
- has_one :card





## addressesテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| postal_code           | string     | null: false                    |
| shipping_area_id      | integer    | null: false, foreign_key: true |
| city                  | string     | null: false                    |
| address_detail        | string     | null: false                    |
| building_name         | string     |                                |
| phone_number          | string     | null: false                    |
| card                  | references | null: false, foreign_key: true |

### アソシエーション

- belongs_to :card





## cardsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item                  | references | null: false, foreign_key: true |
| user                  | references | null: false, foreign_key: true |

### アソシエーション

- belongs_to :user
- has_one  :address
- belongs_to :item