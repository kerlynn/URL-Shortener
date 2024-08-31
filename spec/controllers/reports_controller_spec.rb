require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  describe 'GET #usage' do
    let!(:url1) { FactoryBot.create(:url) }
    let!(:url2) { FactoryBot.create(:url) }

    before do
      # Create visits for the URLs
      FactoryBot.create_list(:visit, 5, url: url1)
      FactoryBot.create_list(:visit, 3, url: url2)
    end

    it 'assigns grouped visits and pagy variables' do
      get :usage

      expect(response).to have_http_status(:ok)

      expect(assigns(:grouped_visits)).to be_present
      expect(assigns(:grouped_visits).size).to eq(2) # Expect 2 URLs

      expect(assigns(:pagy)).to be_present
    end

    it 'paginates the results' do
      get :usage

      pagy = assigns(:pagy)
      expect(pagy).to be_present
      expect(pagy.limit).to eq(10) # Expect 10 max limit
    end
  end
end
