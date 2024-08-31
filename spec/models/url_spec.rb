# spec/models/url_spec.rb
require 'rails_helper'
require 'webmock/rspec'

RSpec.describe Url, type: :model do
  let(:valid_url) { FactoryBot.attributes_for(:url)[:target_url] }
  let(:valid_url_without_https) { FactoryBot.attributes_for(:url, :without_https)[:target_url] }

  before do
    # Stub for FetchTitleService
    stub_request(:get, valid_url)
      .to_return(status: 200, body: '<html><head><title>Example Title</title></head></html>', headers: {})

    # Stub for UrlShortenerService
    allow_any_instance_of(UrlShortenerService).to receive(:call).and_return(true)
  end

  describe 'validations' do
    it 'is valid with a target_url' do
      url = Url.new(target_url: valid_url)
      expect(url).to be_valid
    end

    it 'is not valid without a target_url' do
      url = Url.new(target_url: nil)
      expect(url).not_to be_valid
    end
  end

  describe 'callbacks' do
    it 'prepends http:// if missing' do
      url = Url.create!(target_url: valid_url_without_https)
      expect(url.target_url).to eq("http://#{valid_url_without_https}")
    end

    it 'sets the title and generates a short URL before create' do
      url = Url.new(target_url: valid_url)

      allow_any_instance_of(FetchTitleService).to receive(:call).and_return('Example Title')

      expect(url.title).to be_nil
      url.save
      expect(url.title).to eq('Example Title')
      expect(url.short_url).to be_present
    end

    it 'increments the clicks_count' do
      url = Url.create!(target_url: valid_url)
      expect { url.increment_clicks_count! }.to change { url.reload.clicks_count }.by(1)
    end
  end
end
