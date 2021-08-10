## users　テーブル

| Column         | Type   | Options     |
|----------------|------- |-------------|
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| name           | string | null: false |
| katakana name  | string | null: false |
| birthday       | string | null: false |

has_many :items
has_many :records

## itens テーブル
| Column       | Type       | Options           |
|--------------|----------- |-------------------|
| image        |            |                   |
| item name    | string     | null: false       |
| description  | text       | null: false       |
| user         | references | foreign_key: true |
| category     | string     | null: false       |
| condition    | string     | null: false       |
| delivery fee | string     | null: false       |
| area         | string     | null: false       |
| days         | string     | null: false       |
| price        | string     | null: false       |

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
| prefectures    | string     | null: false |
| municipalities | string     | null: false |
| address        | string     | null: false |
| building name  | string     |             |


belongs_to :record