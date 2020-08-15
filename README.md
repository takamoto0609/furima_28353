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
| birth_year          | integer | null: false |
| birth_month         | integer | null: false |
| birth_day           | integer | null: false |
| log_in?             | boolean | null: false |


### Association

- has_many :items
- has_many :comments
- has_many :credit_card
- has_many :shipping_address

## items テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| name                    | string     | null: false                    |
| image                   | mediumblob | null: false                    |
| price                   | integer    | null: false                    |
| explanation             | text       | null: false                    |
| exhibitor               | references | null: false, foreign_key: true |
| category                | string     | null: false                    |
| status                  | string     | null: false                    |
| shipping_fee_burden     | string     | null: false                    |
| shipping_area           | string     | null: false                    |
| estimated_delivery_date | string     | null: false                    |
| sold_out?               | boolean    | null: false                    |

### Association

- belongs_to :users
- has_many :comments
- belongs_to :credit_card
- belongs_to :shipping_address

## comments テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| comment             | text    | null: false |

### Association

- belongs_to :users
- belongs_to :comments

## credit_card クレジットカード情報テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| card_number      | integer | null: false |
| expiration_month | integer | null: false |
| expiration_year  | integer | null: false |
| security_code    | integer | null: false |

### Association

- belongs_to :users
- has_many :items

## shipping_address 配送先テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal_code    | integer | null: false |
| prefectures    | string  | null: false |
| municipalities | string  | null: false |
| address        | string  | null: false |
| building_name  | string  | null: false |
| phone_number   | integer | null: false |

### Association

- belongs_to :users
- has_many :items