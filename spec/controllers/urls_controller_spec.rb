require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_url) { FactoryBot.attributes_for(:url) }

      it 'creates a new URL' do
        expect do
          post :create, params: { url: valid_url }
        end.to change(Url, :count).by(1)
      end

      it 'redirects to the index with a success notice' do
        post :create, params: { url: valid_url }
        new_url = Url.last
        expect(flash[:notice]).to eq('URL successfully created!')
        expect(new_url.target_url).to eq(valid_url[:target_url])
        expect(new_url.short_url).to be_present
        expect(response).to render_template(:index)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_url) { { target_url: '' } }

      it 'does not create a new URL' do
        expect do
          post :create, params: { url: invalid_url }
        end.not_to change(Url, :count)
      end

      it 'renders the index template with an alert message' do
        post :create, params: { url: invalid_url }
        expect(flash[:alert]).to include("Target url can't be blank")
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'GET #show' do
    let(:url) { FactoryBot.create(:url) }

    before do
      allow(request).to receive(:remote_ip).and_return('8.8.8.8')
    end

    it 'redirects to the target URL' do
      get :show, params: { id: url.short_url }
      expect(response).to redirect_to(url.target_url)
    end

    it 'tracks the visit' do
      expect do
        get :show, params: { id: url.short_url }
      end.to change(url.visits, :count).by(1)
    end
  end
end
