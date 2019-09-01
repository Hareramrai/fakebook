FactoryBot.define do
  factory :photo do
    post 
    image { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/logo.png'))) }
  end
end
