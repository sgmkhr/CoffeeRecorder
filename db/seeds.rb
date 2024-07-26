# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "開始"

user = User.find_or_create_by!(email: "first@example.com") do |user|
  user.password = "111111"
end

user.records.find_or_create_by!(coffee_name: "first_coffee") do |record|
  record.shop_name = "shop_first"
  record.scene = 1
  record.brewing = 2
  record.sweetness = 3
  record.acidity = 3
  record.bitterness = 4
  record.strength = 4
  record.aftertaste = 5
  record.impression = "重厚な感じで美味しかった。私はもう少しさっぱりした方が好みかも"
  record.rate = 3
end

user.records.find_or_create_by!(coffee_name: "second_coffee") do |record|
  record.shop_name = "shop_second"
  record.scene = 3
  record.brewing = 8
  record.sweetness = 2
  record.acidity = 1
  record.bitterness = 5
  record.strength = 4
  record.aftertaste = 3
  record.impression = "苦味はしっかりあるが、後味のバランスが良くてとても私好み"
  record.rate = 2
end

maker = Maker.find_or_create_by!(email: "maker_first@example.com") do |maker|
  maker.company_name = "company_first"
  maker.password = "111111"
end

shop1 = maker.shops.find_or_create_by!(name: "maker_shop_first") do |shop|
  shop.address = "東京都XX区YY町1-3-5"
  shop.introduction = "2024年に開店したばかりの新しい珈琲店です。店内で座ってお召し上がりいただけます。"
  shop.website = "https://example.coffee_recorder.website.example"
end

shop1.coffee_posts.find_or_create_by!(name: "coffee_first") do |coffee|
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

shop1.information_posts.find_or_create_by!(title: "半年記念！") do |information|
  information.body = "ついにオープンから半年経過！たくさんのお客様にお越しいただき、大繁盛で嬉しいかぎりです。半年記念としてご来店された方々へノベルティをお渡ししております。この機会にぜひお待ちしております。"
  information.created_at = "2024-07-01 13:00"
end

puts "終了"