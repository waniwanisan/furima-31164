# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_date      | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| user             | references | foreign_key: true |
| name             | string     | null: false       |
| description      | text       | null: false       |
| category_id      | integer    | null: false       |
| condition_id     | integer    | null: false       |
| postage_payer_id | integer    | null: false       |
| prefecture_id    | integer    | null: false       |
| handling_time_id | integer    | null: false       |
| price            | integer    | null: false       |

### Association

- has_many :comments
- belongs_to :user
- has_one :purchase

## comments テーブル

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| text      | text       | null: false       |
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |

### Association

- belongs_to:item
- belongs_to:user

## addresses テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| post_code     | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| building_name | string     |                   |
| phone_number  | string     | null: false       |
| purchase      | references | foreign_key: true |

### Association

- has_one :purchase

## purchases テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| item   | references | foreign_key: true |
| user   | references | foreign_key: true |

### Association

- belongs_to:user
- belongs_tp:item
- belongs_to:address



