FactoryBot.define do
  factory :item do
    image                    { Rack::Test::UploadedFile.new(Rails.root.join('spec/images/camera.png'), 'image/png') }
    name                     { Faker::Team.name }
    description              { Faker::Lorem.sentence }
    price                    { Faker::Number.between(from: 300, to: 999_999) }
    category_id              { Faker::Number.between(from: 2, to: 6) }
    status_id                { Faker::Number.between(from: 2, to: 11) }
    delivery_fee_id          { Faker::Number.between(from: 2, to: 3) }
    ship_from_id             { Faker::Number.between(from: 2, to: 48) }
    lead_time_id             { Faker::Number.between(from: 2, to: 4) }
    user_id                  { 1 }

    association :user
  end
end
