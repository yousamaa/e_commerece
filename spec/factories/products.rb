FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price }
    description { Faker::Lorem.sentence(word_count: 50) }
    images { Rack::Test::UploadedFile.new('app/assets/images/default_profile.jpg') }
    user
  end
end
