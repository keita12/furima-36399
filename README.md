## users　テーブル

| Column              | Type   | Options      |
|---------------------|------- |--------------|
| nickname            | string | null: false  |
| email               | string | unique: true |
| encrypted_password  | string | null: false  |
| first name          | string | null: false  |
| last name           | string | null: false  |
| katakana first name | string | null: false  |
| katakana last name  | string | null: false  |
| birthday            | date   | null: false  |

has_many :items
has_many :records

## itens テーブル
| Column          | Type       | Options           |
|-----------------|----------- |-------------------|
| item_name       | string     | null: false       |
| description     | text       | null: false       |
| user            | references | foreign_key: true |
| category_id     | integer    | null: false       |
| condition_id    | integer    | null: false       |
| delivery fee_id | integer    | null: false       |
| area_id         | integer    | null: false       |
| shipping_day    | integer    | null: false       |
| price           | integer    | null: false       |

belongs_to :user
has_one :record

## record テーブル
| Column      | Type       | Options           |
|-------------|----------- |-------------------|
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

belongs_to :user
belongs_to :item
has_one :shipping information

## shipping information テーブル
| Column         | Type       | Options     |
|----------------|----------- |-------------|
| telephone num  | string     | null: false |
| postal code    | string     | null: false |
| area_id        | integer    | null: false |
| municipalities | string     | null: false |
| address        | string     | null: false |
| building name  | string     |             |


belongs_to :record