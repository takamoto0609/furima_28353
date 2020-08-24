FactoryBot.define do
  factory :item do
    name                         {Faker::Name.name}
    price                        {Faker::Number.between(from: 300, to: 9999999)}
    explanation                  {Faker::Name.name}
    category_id                  {Faker::Number.between(from: 2, to: 11)}
    status_id                    {Faker::Number.between(from: 2, to: 7)}
    shipping_fee_burden_id       {Faker::Number.between(from: 2, to: 3)}
    shipping_area_id             {Faker::Number.between(from: 2, to: 48)}
    estimated_delivery_date_id   {Faker::Number.between(from: 2, to: 4)}
    association :user
  end
end