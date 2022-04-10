require 'rails_helper'

RSpec.describe 'Users controller', type: :request do
  describe 'GET /index' do
    before :each do
      get '/users'
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'the response includes right text' do
      expect(response.body).to include('Number')
    end

    it 'the correct response status' do
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /show' do
    before :each do
      get '/users/1'
    end
    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'the response includes right text' do
      expect(response.body).to include('Likes')
    end

    it 'the correct status' do
      expect(response.status).to eq(200)
    end
  end
end
