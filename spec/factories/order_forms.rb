FactoryBot.define do
  factory :order_form do
    post_code {"111-1111"}
    prefecture_id {1}
    city {Faker::Lorem.sentence}
    block {Faker::Lorem.sentence}
    building_name {Faker::Lorem.sentence}
    phone_number {"00000000000"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
