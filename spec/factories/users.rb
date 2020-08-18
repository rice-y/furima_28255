FactoryBot.define do
  factory :user do
    nicknname                {"田中さん"}
    last_tname               {"田中"}
    first_name               {"太郎"}
    last_katakana            {"タナカ"}
    first_katakana           {"太郎"}
    birthday                 {1931-03-01}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
end