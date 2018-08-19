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

views
 post index
   nav ver 
    ・ログイン時は投稿、ユーザー設定、設定（プルダウン)、ログアウト
    ・非ログイン時は新規作成、設定(プルダウン、font-sizeとか)

　 post
    ・表示は投稿内容、名前、日時（新しい順）ページねーとをつけたい
    あと編集できるようにしたい。
    削除ボタン、削除押したらアラート（JS）でいく
    全部プルダウン？
    ・押したらマイページ飛びたい
    ・いいねとかコメントもできるようにしたい
    ・何かホバーでイベント

post new
　 ・投稿画面
  
post create
　 ・投稿が完了しました
　 ・戻るボタンと投稿内容の表示


　post　show
  

user show 
  userマイページ
user index
  自分のページ
  