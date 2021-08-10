## users　テーブル

| Column     | Type   | Options     |
|------------|------- |-------------|
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| last name  | string | null: false |
| first name | string | null: false |
| birthday   | string | null: false |

has_many :items
has_many :records

## itens テーブル
| Column      | Type       | Options           |
|-------------|----------- |-------------------|
| image       |            |                   |
| item name   | string     | null: false       |
| information | text       | null: false       |
| user        | references | foreign_key: true |

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
| Column        | Type       | Options     |
|---------------|----------- |-------------|
| telephone num | string     | null: false |
| postal code   | string     | null: false |
| address       | text       | null: false |

belongs_to :record