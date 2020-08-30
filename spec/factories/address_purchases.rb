FactoryBot.define do
  factory :address_purchase do
    postal_code                  { '123-4567' }
    municipalities               {Faker::Name.name}
    address                      {Faker::Name.name}
    phone_number                 {Faker::Number.leading_zero_number(digits: 11)}
    shipping_area_id             {Faker::Number.between(from: 2, to: 48)}
    token                        { 'tok_4bb0fed6a4652d5f95f3c4ec5736' }
    association :user
    association :item
  end
end