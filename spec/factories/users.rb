FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    avatar { Rack::Test::UploadedFile.new('app/assets/images/default_profile.jpg') }
  end
end
