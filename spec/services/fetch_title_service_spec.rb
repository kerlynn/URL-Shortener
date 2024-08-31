require 'rails_helper'
require 'webmock/rspec'
require 'nokogiri'

RSpec.describe FetchTitleService, type: :service do
  describe '#call' do
    let(:valid_url) { FactoryBot.attributes_for(:url)[:target_url] }
    let(:invalid_url) { FactoryBot.attributes_for(:url, :invalid_url)[:target_url] }
    let(:html_body) { '<html><head><title>Example Domain</title></head><body></body></html>' }
    let(:service) { FetchTitleService.new(valid_url) }

    before do
      stub_request(:get, valid_url)
        .with(headers: { 'User-Agent' => 'Mozilla/5.0' })
        .to_return(status: 200, body: '<html><head><title>Example Domain</title></head><body></body></html>', headers: {})
    end

    context 'when the URL is valid and the title is present' do
      it 'fetches the title from the URL' do
        expect(service.call).to eq('Example Domain')
      end
    end

    context 'when an error occurs while fetching the title' do
      let(:service) { FetchTitleService.new(invalid_url) }

      before do
        stub_request(:get, invalid_url)
          .to_raise(StandardError)
      end

      it 'returns "Unknown Title"' do
        expect(service.call).to eq('Unknown Title')
      end
    end
  end
end
