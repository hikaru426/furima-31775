FactoryBot.define do
  factory :buyer_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '689-3101' }
    prefecture_id { 1 }
    city { '西伯郡' }
    address { '大山町' }
    phone_number { '09011112222' }

    association :user
    association :item
  end
end
