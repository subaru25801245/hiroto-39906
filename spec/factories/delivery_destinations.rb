FactoryBot.define do
  factory :delivery_destination do
    post_code { "MyString" }
    prefecture_id { 1 }
    area { "MyString" }
    address { "MyString" }
    build_name { "MyString" }
    tel { "MyString" }
    buy_record { nil }
  end
end
