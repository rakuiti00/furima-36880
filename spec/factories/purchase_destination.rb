FactoryBot.define do
  factory :purchase_destination do
    postal_code { '123-4567' }
    shipping_area_id {Faker::Number.between(from: 2, to: 48)}
    city { '大阪府' }
    address {'1-2'}
    building_name { '大阪ハイツ' }
    phone_number {'08031330111'}
    token {"xxxxxxxxxxxxxxxxxx"}
    
  end
end
