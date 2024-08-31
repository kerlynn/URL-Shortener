FactoryBot.define do
  factory :visit do
    ip_address { '8.8.8.8' }
    geolocation do
      'Mountain View, CA, US'
    end
    association :url
  end
end
