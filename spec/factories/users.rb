FactoryBot.define do
  factory :user do
    nickname {"hoge"}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name {"hoge"}
    first_name {"hoge"}
    last_name_kana {"hoge"}
    first_name_kana {"hoge"}
    birthday {"1992-1-13"}
  end
end