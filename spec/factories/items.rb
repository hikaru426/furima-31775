FactoryBot.define do
  factory :item do
    name { '田中' }
    info { '商品の情報' }
    category_id { 1 }
    condition_id { 1 }
    price { 300 }
    shipping_id { 1 }
    prefecture_id { 1 }
    delivery_id { 1 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
