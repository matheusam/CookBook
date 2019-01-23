FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password 'rspec@test'
  end
end
