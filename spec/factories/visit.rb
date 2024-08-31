FactoryBot.define do
  factory :visit do
    ip_address { '8.8.8.8' }
    association :url

    trait :ip_without_location do
      ip_address { 'fake_ip_address' }
    end
  end
end
