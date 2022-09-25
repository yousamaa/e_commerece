# frozen_string_literal: true

Product.destroy_all

10.times do
  p = Product.create(name: Faker::Commerce.unique.product_name,
                     price: Faker::Commerce.price,
                     description: Faker::Lorem.sentence(1),
                     user_id: 1)

  downloaded_image = URI.open("https://source.unsplash.com/600x600/?#{p.name}")
  p.images.attach(io: downloaded_image, filename: "m-#{p.name}.jpg")
end
