# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   Character.create(name: 'Luke', movie: movies.first)

 Admin.create(email: 'admin@mail', password: 'password')
 Customer.create(
                 email: 'test1@test',
                 password: '000000',
                 postal_code: '1111111',
                 address: '静岡県静岡市久能山東照宮',
                 phone_number: '09000000000',
                 first_name: '徳川',
                 first_name_kana: 'トクガワ',
                 last_name: '家康',
                 last_name_kana: 'イエヤス'
                 )
 Customer.create(
                 email: 'test2@test',
                 password: '000000',
                 postal_code: '2222222',
                 address: '京都府京都市建勲神社',
                 phone_number: '08000000000',
                 first_name: '織田',
                 first_name_kana: 'オダ',
                 last_name: '信長',
                 last_name_kana: 'ノブナガ'
                 )
 Customer.create(
                 email: 'test3@test',
                 password: '000000',
                 postal_code: '3333333',
                 address: '京都府京都市豊国神社',
                 phone_number: '07000000000',
                 first_name: '豊臣',
                 first_name_kana: 'トヨトミ',
                 last_name: '秀吉',
                 last_name_kana: 'ヒデヨシ'
                 )
 Genre.create(name: 'ケーキ')
 Genre.create(name: '焼き菓子')
 Genre.create(name: 'プリン')
 Genre.create(name: 'キャンディ')
 Item.create(
             name: 'チョコレートケーキ',
             introduction: 'スポンジで生チョコをサンドした定番の人気チョコレートケーキです。',
             price: '2500',
             image: open('./app/assets/images/chocolate_cake.jpg'),
             genre_id: 1
 )
 Item.create(
             name: 'フルーツタルト',
             introduction: '旬のフルーツでデコレーションされた人気のミニタルト3個セットです。',
             price: '1500',
             image: open('./app/assets/images/tarte.jpg'),
             genre_id: 1
 )
 Item.create(
             name: 'マスカットのショートケーキ',
             introduction: 'マスカットの爽やかな甘味が特徴のショートケーキです。',
             price: '2500',
             image: open('./app/assets/images/muscat.jpg'),
             genre_id: 1
 )
 Item.create(
             name: 'ベリーレアチーズケーキ',
             introduction: 'ベリーをあしらった見た目も可愛いレアチーズケーキです。',
             price: '2500',
             image: open('./app/assets/images/cheese.jpg'),
             genre_id: 1
 )
 Item.create(
             name: 'マカロン',
             introduction: '女性に大人気の定番マカロンです。レモン・いちご・ピスタチオ・バニラ・チョコレートの5個入りです。',
             price: '800',
             image: open('./app/assets/images/macaron.jpg'),
             genre_id: 2
 )
 Item.create(
             name: 'アイシングクッキー',
             introduction: 'カラフルで可愛い見た目が人気のアイシングクッキーです。イベントやプレゼントにオススメです。6個入り。',
             price: '500',
             image: open('./app/assets/images/cookie.jpg'),
             genre_id: 2
 )
 Item.create(
             name: 'クレームブリュレ',
             introduction: '定番のクレームブリュレです。ほろ苦く甘いカラメルが人気の秘訣です。',
             price: '300',
             image: open('./app/assets/images/pudding.jpg'),
             genre_id: 3
 )
 Item.create(
             name: 'ミルクプリン',
             introduction: '優しい味わいが懐かしいミルクプリンです。',
             price: '250',
             image: open('./app/assets/images/milk.jpg'),
             genre_id: 3
 )
 Item.create(
             name: '柿プリン',
             introduction: '旬の柿をペーストにしてプリン生地に練り込みました。冬季限定のプリンです。',
             price: '250',
             image: open('./app/assets/images/persimmon.jpg'),
             genre_id: 3
 )
 Item.create(
             name: '蜂蜜キャンディ',
             introduction: '蜂蜜を練り込んだキャンディです。喉が痛む季節にオススメです。',
             price: '400',
             image: open('./app/assets/images/candy.jpg'),
             genre_id: 4
 )
 Item.create(
             name: 'みぞれ飴',
             introduction: '昔ながらのカラフルなみぞれ飴です。',
             price: '400',
             image: open('./app/assets/images/mizore.jpg'),
             genre_id: 4
 )
 Item.create(
             name: 'いちご飴',
             introduction: '厳選された大粒のあまおうを使ったいちご飴です。',
             price: '500',
             image: open('./app/assets/images/strawberry.jpg'),
             genre_id: 4
 )