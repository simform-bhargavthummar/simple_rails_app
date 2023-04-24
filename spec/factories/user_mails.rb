FactoryBot.define do
  factory "user_mail" do
    id { Faker::Number.between(from: 1, to: 100) }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    image {
      Rack::Test::UploadedFile.new(
        Rails.root.join('spec', 'support', 'test_image.jpg'), 'image/jpeg'
      )
    }
  end
end
