FactoryBot.define do
  factory :item do
    description {Faker::Lorem.sentence}
    name {Faker::Lorem.sentence}
    category_id {1}
    condition_id {1}
    postage_payer_id {1}
    prefecture_id {1}
    handling_time_id {1}
    price {Faker::Number.between(from: 300, to: 9999999)}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end