FactoryBot.define do
  factory :order_form do
    post_code {Faker::Address.postcode}
    prefecture_id {1}
    city {Faker::Lorem.sentence}
    block {Faker::Lorem.sentence}
    building_name {Faker::Lorem.sentence}
    phone_number {Faker::PhoneNumber.phone_number}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
