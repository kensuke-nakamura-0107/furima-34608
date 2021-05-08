# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| password_confirm  | string | null: false |
| last_name_kanji   | string | null: false |
| first_name_kanji  | string | null: false |
| last_name_kana    | string | null: false |
| first_name_kana   | string | null: false |
| birth_year        | integer| null: false |
| birth_month       | integer| null: false |
| birth_date        | date   | null: false |

### Association

- has_many :orders
- has_many :items
- has_many :comments
- has_many :favorites
- has_many :warnings




## items テーブル

| Column      | Type       | Options                         |
| ----------= | ---------- | ------------------------------- |
| image       | xxxxxx     | xxxxxx                           |
| name        | text       | null: false                     |
| category    | references | null: false, foreign_key: true  |
| condition   | references | null: false, foreign_key: true  |
| postage     | references | null: false, foreign_key: true  |
| prefecture  | references | null: false, foreign_key: true  |
| period      | references | null: false, foreign_key: true  |
| price       | integer    | null: false                     |
| fee_rate    | float      | null: false                     |
| Revenue     | integer    | null: false                     |
| provider_id | references | null: false, foreign_key: true  |
| status      | Boolean    | null: false                     |

### Association

- has_many :orders
- has_many :comments
- has_many :favorites
- has_many :warnings
- belongs_to :users
- belongs_to :categories
- belongs_to :conditions
- belongs_to :postages
- belongs_to :prefectures
- belongs_to :period




## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item_id   | references | null: false, foreign_key: true |
| user_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :order_addresses




## order_addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| order_id     | references | null: false, foreign_key: true |
| post_code    | integer    | null: false                    |
| prefecture   | references | null: false, foreign_key: true |
| city         | string     | null: false                    |
| address      | text       | null: false                    |
| building     | text       | null: false                    |
| phone_number | integer    |                                |

### Association

- belongs_to :orders
- belongs_to :prefectures




## categories テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | text       | null: false                    |

### Association

- has_many :items




## conditions テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| condition | text       | null: false                    |

### Association

- has_many :items




## postages テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| postage   | text       | null: false                    |

### Association

- has_many :items




## postages テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| postage   | text       | null: false                    |

### Association

- has_many :items



## period テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| period    | text       | null: false                    |

### Association

- has_many :items




## prefecture テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| prefecture | text       | null: false                    |

### Association

- has_many :items
- has_many :order_address




## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_id    | references | null: false, foreign_key: true |
| user_id    | references | null: false, foreign_key: true |
| comment    | text       | null: false                    |

### Association

- belongs_to :users
- belongs_to :items




## favorites テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_id    | references | null: false, foreign_key: true |
| user_id    | references | null: false, foreign_key: true |
| fav_fg     | text       | null: false                    |

### Association

- belongs_to :users
- belongs_to :items




## warnings テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_id    | references | null: false, foreign_key: true |
| user_id    | references | null: false, foreign_key: true |
| warning_fg | text       | null: false                    |

### Association

- belongs_to :users
- belongs_to :items