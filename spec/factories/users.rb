FactoryBot.define do
  factory :user do
    nickname                { '田中さん' }
    last_name               { '田中' }
    first_name               { '太郎' }
    last_katakana            { 'タナカ' }
    first_katakana           { 'タロウ' }
    birthday                 { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
