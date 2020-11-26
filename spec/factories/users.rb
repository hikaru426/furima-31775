FactoryBot.define do
  factory :user do
    nick_name { 'aaaaa' }
    first_name { '井上' }
    last_name { '光' }
    email { Faker::Internet.free_email }
    password = 'hikaru2'
    password { password }
    password_confirmation { password }
    first_name_kana { 'イノウエ' }
    last_name_kana { 'ヒカル' }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
