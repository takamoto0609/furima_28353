FactoryBot.define do
  factory :user do
    name              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name_kannji{Faker::Japanese::Name.first_name}
    last_name_kannji{Faker::Japanese::Name.last_name}
    first_name_katakana{Faker::Japanese::Name.first_name.yomi}
    last_name_katakana{Faker::Japanese::Name.last_name.yomi}
    birth_day{Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end