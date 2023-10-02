# spec/factories/items.rb

FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name } # ランダムな商品名
    info { Faker::Lorem.sentence(word_count: 10) } # ランダムな情報 (10単語の文章)
    category_id { 1 }
    condition_id { 1 }
    del_burden_id { 1 }
    prefecture_id { 1 }
    del_day_id { 1 }
    price { rand(300..9999999) } # 300以上9999999以下のランダムな価格
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
