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
やること！

db 設計
user table
 name : strings
 email : strings
 pass

 hasmany :posts

post table
 comment: strings
 user_id: integer :null: false, foreign_key: true

 belongs_to: user


DB作成

コントローラー作成
user  #new create edit
post  #index new create edit update show delete 7つ？


routes設定
root posti#index
