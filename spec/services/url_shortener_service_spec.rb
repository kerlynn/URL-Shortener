require 'rails_helper'
require 'securerandom'

RSpec.describe UrlShortenerService, type: :service do
  describe '#call' do
    let(:url) { Url.new }
    let(:service) { UrlShortenerService.new(url) }

    before do
      allow(SecureRandom).to receive(:alphanumeric).and_return('short_url_1', 'short_url_2')
    end

    context 'when no short URL already exists' do
      it 'assigns a unique short URL to the URL object' do
        allow(Url).to receive(:exists?).with(short_url: 'short_url_1').and_return(false)
        allow(Url).to receive(:exists?).with(short_url: 'short_url_2').and_return(false)

        result = service.call

        expect(result).to eq('short_url_1')
      end
    end

    context 'when a short URL already exists' do
      before do
        allow(Url).to receive(:exists?).with(short_url: 'short_url_1').and_return(true)
        allow(Url).to receive(:exists?).with(short_url: 'short_url_2').and_return(false)
      end

      it 'generates a new unique short URL if the initial one is taken' do
        result = service.call

        expect(result).to eq('short_url_2')
      end
    end
  end
end
