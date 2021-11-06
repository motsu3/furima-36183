FactoryBot.define do
  factory :user do
    nickname {"hoge"}
    email {Faker::Internet.free_email}
    password = "la"+Faker::Internet.password(min_length: 4)
    password {password}
    password_confirmation {password}
    last_name {"山田"}
    first_name {"太郎"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birthday {"1992-1-13"}
  end
end