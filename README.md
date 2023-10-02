# テーブル設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| last_name           | string  | null: false               |
| last_kana           | string  | null: false               |
| first_name          | string  | null: false               |
| first_kana          | string  | null: false               |
| birth_date          | date    | null: false               |

### Association

- has_many :items
- has_many :buy_records

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| info          | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| del_burden_id | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| del_day_id    | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_one :buy_record
- belongs_to :user

## buy_records テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item                 | references | null: false, foreign_key: true |
| user                 | references | null: false, foreign_key: true |

### Association

- has_one :delivery_destination
- belongs_to :item
- belongs_to :user

## delivery_destinations テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| post_code            | string     | null: false                    |
| prefecture_id        | integer    | null: false                    |
| area                 | string     | null: false                    |
| address              | string     | null: false                    |
| build_name           | string     |                                |
| tel                  | string     | null: false                    |
| buy_record           | references | null: false, foreign_key: true |

### Association

- belongs_to :buy_record