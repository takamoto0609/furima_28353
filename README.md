# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

# テーブル設計

## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| name                | string  | null: false |
| email               | string  | null: false |
| password            | string  | null: false |
| first_name_kannji   | string  | null: false |
| last_name_kannji    | string  | null: false |
| first_name_katakana | string  | null: false |
| last_name_katakana  | string  | null: false |
| birth_day           | date    | null: false |


### Association

- has_many :items
- has_many :transaction_information

## items テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| name                       | string     | null: false                    |
| image                      | mediumblob | null: false                    |
| price                      | integer    | null: false                    |
| explanation                | text       | null: false                    |
| user                       | references | null: false, foreign_key: true |
| category_id                | integer    | null: false                    |
| status_id                  | integer    | null: false                    |
| shipping_fee_burden_id     | integer    | null: false                    |
| shipping_area_id           | integer    | null: false                    |
| estimated_delivery_date_id | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :transaction_information

## transaction_information 取引に関する情報管理テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| user                       | references | null: false, foreign_key: true |
| item                       | references | null: false, foreign_key: true |
| sold_out?                  | boolean    | null: false                    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses 配送先テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| postal_code             | string     | null: false                    |
| prefectures_id          | integer    | null: false                    |
| municipalities          | string     | null: false                    |
| address                 | string     | null: false                    |
| building_name           | string     |                                |
| phone_number            | string     | null: false                    |
| transaction_information | references | null: false, foreign_key: true |

### Association

- belongs_to :transaction_information