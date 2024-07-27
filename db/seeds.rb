# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "開始"

user = User.find_or_create_by!(email: "user@example.com") do |user|
  user.password = "111111"
end

user.records.find_or_create_by!(coffee_name: "イノダコーヒー") do |record|
  record.shop_name = "京都イノダコーヒー"
  record.scene = 3
  record.brewing = 0
  record.sweetness = 1
  record.acidity = 1
  record.bitterness = 4
  record.strength = 4
  record.aftertaste = 3
  record.impression = "酸味がほとんどなく、心地よい苦味。後味もバランスが良く今までで一番好きかも"
  record.rate = 5
  record.record_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/inoda.jpeg"), filename: "inoda_coffee.jpeg")
end

user.records.find_or_create_by!(coffee_name: "colombia ENCISO") do |record|
  record.shop_name = "abno"
  record.scene = 1
  record.brewing = 0
  record.sweetness = 2
  record.acidity = 4
  record.bitterness = 1
  record.strength = 2
  record.aftertaste = 2
  record.impression = "酸味が特徴のフルーティなコーヒーだった。普段の好みとは違うけど美味しかった"
  record.rate = 3
  record.record_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/abno.jpeg"), filename: "abno_coffee.jpeg")
end

user.records.find_or_create_by!(coffee_name: "丸山珈琲ハウスブレンド") do |record|
  record.shop_name = "丸山珈琲"
  record.scene = 3
  record.brewing = 0
  record.sweetness = 2
  record.acidity = 2
  record.bitterness = 3
  record.strength = 4
  record.aftertaste = 3
  record.impression = "バランスのいい苦味がしっかりあり、酸味もほのかにある。美味しかった"
  record.rate = 4
  record.record_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/maruyama.jpeg"), filename: "maruyama_coffee.jpeg")
end

user.records.find_or_create_by!(coffee_name: "colombia milano NIU") do |record|
  record.shop_name = "TABI TO COFFEE Asakusa"
  record.scene = 1
  record.brewing = 1
  record.sweetness = 3
  record.acidity = 3
  record.bitterness = 3
  record.strength = 3
  record.aftertaste = 5
  record.impression = "今まで飲んだことないトロピカルなコーヒー。ココナッツ、パイナップルの風味がした"
  record.rate = 4
  record.record_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/tabito.jpeg"), filename: "tabito_coffee.jpeg")
end

maker = Maker.find_or_create_by!(email: "maker@example.com") do |maker|
  maker.company_name = "EXAMPLE株式会社"
  maker.password = "111111"
end

shop1 = maker.shops.find_or_create_by!(name: "BEST EXAMPLE COFFEE") do |shop|
  shop.address = "東京都XX区YY町1-3-5"
  shop.introduction = "2024年に開店したばかりの新しい珈琲店です。\n珍しいコーヒーから定番のコーヒーまで数多く取り揃えております。\n店内で座ってお召し上がりいただけます。"
  shop.website = "https://example.coffee_recorder.website.example"
end

shop1.coffee_posts.find_or_create_by!(name: "coffee A") do |coffee|
  coffee.introduction = "当店イチオシのコーヒーです。店内でもテイクアウトでも。豆も販売中"
  coffee.online_sale = true
  coffee.brewing = 1
  coffee.roasting = 3
  coffee.grind_size = 3
  coffee.sweetness = 2
  coffee.acidity = 2
  coffee.bitterness = 3
  coffee.strength = 3
  coffee.aftertaste = 3
  coffee.supplement = "非常にバランスの良いコーヒーです"
end

shop1.coffee_posts.find_or_create_by!(name: "coffee B") do |coffee|
  coffee.introduction = "フルーティさが特徴。酸味派の方におすすめ"
  coffee.online_sale = true
  coffee.brewing = 1
  coffee.roasting = 3
  coffee.grind_size = 3
  coffee.sweetness = 3
  coffee.acidity = 4
  coffee.bitterness = 2
  coffee.strength = 2
  coffee.aftertaste = 2
  coffee.supplement = "軽やかな舌あたりのクリーンなコーヒーです"
end

shop1.information_posts.find_or_create_by!(title: "半年記念！") do |information|
  information.body = "ついにオープンから半年経過！たくさんのお客様にお越しいただき、大繁盛で嬉しいかぎりです。\n半年記念としてご来店された方々へノベルティをお渡ししております。\nこの機会にぜひお待ちしております。"
  information.created_at = "2024-07-01 13:00"
end

puts "終了"