## アプリケーション名
bacant_room

## 概要
アパートなどの空き部屋を貸し出すアプリ。

## URL
デプロイ次第、記述します。

## 課題解決
リモートワークが増えてきている中、自分だけの場所で仕事がしたいとういう方にアパート等の秋部屋を数時間、数日間貸し出し場所を提供する。
貸し出す方は、空き部屋等を無駄にせずに、提供する事で収入を得る事ができる。

## 要件定義
ユーザー側
1.ユーザー登録/管理
目的：名前や住所、電話番号等の情報の個人情報を登録することにより、アプリを活用する事ができる。

詳細：会社名等、細かい情報も入力する事により、貸す側と問題が起きないようにする。

2.場所の検索
目的：都道府県や市町村等、どの場所で借りたいかを検索する事ができる。

詳細：都道府県、市町村をカテゴリーから選べる。また検索窓からその他の情報で検索できるようにする。

ストーリー：
アプリを使用するユーザーは使用の目的に会った部屋を簡単に見つける事ができルメリットがある。

3.貸し部屋の詳細
目的：借りる部屋の詳細を見る事で、自分の目的に会った部屋を選別できる。

詳細：
・自分の目的に会った場所、環境等を詳細で見る事で目的に会った部屋の使用ができる。
・詳細ページから借りる部屋を決定し、借りる時間/日にち等の情報を記述するページへ遷移できる。


オーナー側
1.オーナー登録/管理
目的：オーナー情報を記述する事で貸し部屋を登録/削除等ができる。

詳細：借りる側との問題を回避するため、貸し出す側の情報も詳細に記述する。

2.カス部屋の情報等を提示する。（出品）
目的：貸す部屋の場所等を記述し出品することができる。

詳細：
・使用条件、契約、金額等を記述し、マッチしたユーザーに部屋を貸す事ができる。
・部屋の写真も提示する事ができる。

ストーリー：
借りたいユーザーに対して条件を提示し、契約する事で問題が起きた時に対応/対処ができるように条件を記載する事ができる。また、マッチしたユーザーに部屋を貸す事で、空き部屋を無駄にせず収入が得られるようになる。

## ER図
https://app.lucidchart.com/documents/edit/4cd874a5-5b8b-42e7-a9e9-023e660c3bbc/0_0?beaconFlowId=6CD5E03CC451A721#?folder_id=home&browser=icon

## バージョン/導入したライブラリ
rails: 6.0.0
mysql2: 0.4.4

gem 'pry-rails'
gem 'devise'
gem 'rails-i18n'
gem 'mini_magick'
gem 'image_processing', '~> 1.2'




## usersテーブル

| Column                  | Type    | Options     |
| ----------------------- | ------- | ----------- |
| first_name              | string  | null: false |
| last_name               | string  | null: false |
| first_name_kana         | string  | null: false |
| postal_code             | string  | null: false |
| prefectures_id          | integer | null: false |
| city                    | string  | null: false |
| town                    | string  | null: false |
| address_number          | string  | null: false |
| buillding               | string  | null: false |
| phone_number            | string  | null: false |
| phone_number2           | string  | null: false |
| gender                  | string  | null: false |
| birthday                | date    | null: false |
| age                     | integer | null: false |
| company_name            | string  | null: false |
| company_city            | string  | null: false |
| company_town            | string  | null: false |
| company_address_number  | string  | null: false |
| company_building        | string  | null: false |
| company_phone_number    | string  | null: false |
| password                | string  | null: false |
| password_comfirmation   | string  | null: false |

### association
- has_one rooms
- has_one resevation


## roomsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| images             | text       | null: false                    |
| postal_code        | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| city               | string     | null: false                    |
| town               | string     | null: false                    |
| address_number     | string     | null: false                    |
| building           | string     | null: false                    |
| price              | integer    | null: false                    |
| times              | date       | null: false, foreign_key: true |
| comment            | text       | null: false                    |
| owner_id           | references | null: false, foreign_key: true |

### association
- belongs_to: user
- has_many: images
- has_many: owner


## imagesテーブル

| Column       | Type        | Options                        |
| -------------| ------------| ------------------------------ |
| image        | string      | null: false                    |
| rooms        | references  | null: false, foreign_key: true |

### association
- belongs_to: rooms


## owner

| Column                  | Type    | Options     |
| ----------------------- | ------- | ----------- |
| first_name              | string  | null: false |
| last_name               | string  | null: false |
| first_name_kana         | string  | null: false |
| postal_code             | string  | null: false |
| prefectures_id          | integer | null: false |
| city                    | string  | null: false |
| town                    | string  | null: false |
| address_number          | string  | null: false |
| buillding               | string  | null: false |
| phone_number            | string  | null: false |
| phone_number2           | string  | null: false |
| gender                  | string  | null: false |
| birthday                | date    | null: false |
| age                     | integer | null: false |
| company_name            | string  | null: false |
| company_city            | string  | null: false |
| company_town            | string  | null: false |
| company_address_number  | string  | null: false |
| company_building        | string  | null: false |
| company_phone_number    | string  | null: false |
| password                | string  | null: false |
| password_comfirmation   | string  | null: false |


### association
- has_many: rooms


## resercation

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| calendar        | date        | null: false                    |
| tooms           | references  | null: false, foreign_key: true |

### association
- belongs_to: user
- belongs_to: rooms
