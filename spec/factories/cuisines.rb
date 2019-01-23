FactoryBot.define do
  factory :cuisine do
    name { FFaker::Address.country }
  end
end
