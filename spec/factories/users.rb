FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'sample123' }
    password_confirmation { password }
    nickname { Faker::Name.unique.name }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
    last_name { Gimei.last.kanji }
    first_name { Gimei.first.kanji }
    last_kana { Gimei.last.katakana }
    first_kana { Gimei.first.katakana }
  end
end
