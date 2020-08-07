# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| --------     | ------ | ----------- |
| nick_name    | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
|password_confirmation| string | null: false |
| last_name    | string | null: false |
| first_name   | string | null: false |
|last_katakana | string | null: false |
|first_katakana| string | null: false |
| birthday     | integer| null: false |

### Association

- has_many :items
- has_many :purchase


## items テーブル

| Column      | Type   | Options     |
| ------      | ------ | ----------- |
| image       | string | null: false |
| item_name   | string | null: false |
| description | text   | null: false |
| price       | integer| null: false |
| category    | string | null: false |
| status      | string | null: false |
| delivery_fee| string | null: false |
| ship_from   | string | null: false |
| leadtime    | string | null: false |
| user_id     | string | null: false , foreign_key:true|

### Association

- belongs_to :user
- belongs_to :purchase

## purchase_info テーブル

| Column        | Type       | Options      |
| -------       | ---------- | ------------ |
| user_id       | string     | null: false, foreign_key: true |
| postal_code   | string     | null: false  |
| city          | string     | null: false  |
| adress        | string     | null: false  |
| building_name | string     | null: false  |
| phone_number  | references | null: false  |

### Association

- belongs_to :room
- belongs_to :user
