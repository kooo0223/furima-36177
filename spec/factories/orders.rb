FactoryBot.define do
  factory :order do
    postal_code    { '123-4567' }
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    city           { 'あいうえお町' }
    address_line   { '1-1' }
    building       { '東京ハイツ' }
    phone_number   { '09012345678' }
    user_id        { 1 }
    item_id        { 1 }
    token          {"tok_abcdefghijk00000000000000000"}
  end
end