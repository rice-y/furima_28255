# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| nick_name | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| last_name | string | null: false |
| first_name| string | null: false |

### Association

- has_many :items


## items テーブル

| Column     | Type   | Options     |
| ------     | ------ | ----------- |
| image      | string | null: false |
| item_name  | string | null: false |
| description| text   | null: false |
| price      | integer| null: false |

### Association

- belongs_to :user
- belongs_to :purchase

## purchase_info テーブル

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| user_id     | string     |                            |
| postal_code | string     |                            |
| city        | string     |                            |
| adress      | string     |                            |
| building_name | string   |                            |
| phone_number  | references | null: false, foreign_key:true |

### Association

- belongs_to :room
- belongs_to :user
