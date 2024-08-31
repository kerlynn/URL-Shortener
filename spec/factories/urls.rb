FactoryBot.define do
  factory :url do
    target_url { 'https://example.com' }
    short_url { SecureRandom.alphanumeric(8) }

    trait :without_https do
      target_url { 'google.com' }
    end

    trait :invalid_url do
      target_url { 'https://invalid.url/' }
    end
  end
end
