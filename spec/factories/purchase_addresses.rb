FactoryBot.define do
  factory :purchase_address do
    item_id                  { 2 }
    user_id                  { 1 }
    postal_code              { '285-0546' }
    prefecture_id            { 8 }
    city                     { '東京都' }
    address                  { '1-1' }
    building_name            { '六本木ヒルズ' }
    phone_number             { '09012345678' }
    purchase_id              { 1 }
  end
end
