# テーブル設計

## users テーブル

| Column            | Type   | Options                  |
| ----------------- | ------ | ------------------------ |
| nickname          | string | null: false              |
| email             | string | null: false, unique:true |
| encrypted_password| string | null: false              |
| last_name_kanji   | string | null: false              |
| first_name_kanji  | string | null: false              |
| last_name_kana    | string | null: false              |
| first_name_kana   | string | null: false              |
| birthday          | date   | null: false              |

### Association

- has_many :orders
- has_many :items
- has_many :comments
- has_many :favorites
- has_many :warnings




## items テーブル

| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------- |
| name           | text       | null: false                     |
| description    | text       | null: false                     |
| user           | references | ull: false, foreign_key: true   |
| category_id    | integer    | null: false                     |
| condition_id   | integer    | null: false                     |
| postage_id     | integer    | null: false                     |
| prefecture_id  | integer    | null: false                     |
| period_id      | integer    | null: false                     |
| price          | integer    | null: false                     |

### Association

- belongs_to :user
- has_many :orders
- has_many :comments
- has_many :favorites
- has_many :warnings




## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :order_address




## order_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | text       | null: false                    |
| building      | text       |                                |
| phone_number  | string     | null: false                    |

### Association

- belongs_to :orders
- belongs_to :prefectures


## comments テーブル

| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
| comment | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :item




## favorites テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |
| fav_fg     | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :item




## warnings テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |
| warning_fg | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :item