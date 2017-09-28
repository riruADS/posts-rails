FactoryGirl.define do
  factory :post do
    title { Faker::StarWars.wookiee_sentence }
    is_private false || true
  end
end
