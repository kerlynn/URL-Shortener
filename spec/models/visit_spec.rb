require 'rails_helper'

RSpec.describe Visit, type: :model do
  let(:visit) { FactoryBot.build(:visit) }
  let(:visit_without_location) { FactoryBot.build(:visit, :ip_without_location) }

  context 'when setting geolocation' do
    it 'sets geolocation based on IP address' do
      allow(Geocoder).to receive(:search).with('8.8.8.8').and_return([
                                                                       OpenStruct.new(city: 'Mountain View',
                                                                                      region: 'California', country: 'US')
                                                                     ])

      visit.save

      expect(visit.geolocation).to eq('Mountain View, California, US')
    end

    it 'sets geolocation to Unknown if no location is found' do
      allow(Geocoder).to receive(:search).with('fake_ip_address').and_return([])

      visit_without_location.save

      expect(visit_without_location.geolocation).to eq('Unknown')
    end
  end
end
