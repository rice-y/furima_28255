# テーブル設計

## users テーブル

| Column               | Type   | Options                 |
| -------------------- | ------ | ------------------------|
| nick_name            | string | null: false             |
| email                | string | null: false             |
| password             | string | null: false             |
|password_confirmation | string | null: false             |
| last_name            | string | null: false             |
| first_name           | string | null: false             |
|last_katakana         | string | null: false             |
|first_katakana        | string | null: false             |
| birthday             | date   | null: false             |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column      | Type      | Options                       |
| ------      | ------    | ------------------------------|
| image       | string    | null: false                   |
| name        | string    | null: false                   |
| description | text      | null: false                   |
| price       | integer   | null: false                   |
| user        | references| null: false , foreign_key:true|
| category    | integer   | null: false                   |
| status      | integer   | null: false                   |
| delivery_fee| integer   | null: false                   |
| ship_from   | integer   | null: false                   |
| leadtime    | integer   | null: false                   |

### Association

- belongs_to : user
- has_one : purchase


## addresses テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | -------------------------------|
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |

### Association
- belongs_to : purchase


## purchases テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | -------------------------------|
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address