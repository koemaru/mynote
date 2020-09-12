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

* ...

# Mynote DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :pages
- has_many :notes

## pagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|image|string||
|user_id|integer|null :false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :notes

## notesテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false, unique: true|
### Association
- has_many :pages
- belongs_to :users
