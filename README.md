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
- has_many :purchase



## items テーブル

| Column      | Type      | Options                       |
| ------      | ------    | ------------------------------|
| image       | string    | null: false                   |
| item_name   | string    | null: false                   |
| description | text      | null: false                   |
| price       | integer   | null: false                   |
| user_id     | references| null: false , foreign_key:true|

### Association

- belongs_to :user
- has_one :purchase


## addresses テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | -------------------------------|
| user_id       | references | null: false, foreign_key: true |
| postal_code   | string     | null: false                    
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    
| building_name | string     | null: false                    |
| phone_number  | string    | null: false                    |

### Association
belong_to : purchase


- has_many :user


##purchase テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | -------------------------------|
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address