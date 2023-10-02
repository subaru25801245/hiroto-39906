# spec/factories/buy_record_forms.rb
FactoryBot.define do
  factory :buy_record_form do
    post_code       { '123-4567' }
    prefecture_id   { Faker::Number.between(from: 1, to: 47) }
    area            { Faker::Address.city }
    address         { Faker::Address.street_address }
    build_name      { Faker::Address.secondary_address }
    tel             { Faker::PhoneNumber.subscriber_number(length: 11) }
    token           { "tok_#{SecureRandom.hex}" }

  end
end
