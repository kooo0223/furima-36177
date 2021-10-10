FactoryBot.define do
  factory :item do
    image                    {'app/assets/images/item_sample01.jpg'}
    product                  {Faker::Lorem.sentence}
    explanation              {Faker::Lorem.sentence}
    price                    {Faker::Number.between(from: 300, to: 9999999)}
    category_id              {Faker::Number.between(from: 2, to: 11)}
    sales_status_id          {Faker::Number.between(from: 2, to: 7)}
    shipping_fee_status_id   {Faker::Number.between(from: 2, to: 3)}
    prefecture_id            {Faker::Number.between(from: 2, to: 48)}
    scheduled_delivery_id    {Faker::Number.between(from: 2, to: 4)}
    association              :user

  end
end
