require 'rails_helper'

RSpec.describe 'Post controllers', type: :request do
  describe 'GET /index' do
    before :each do
      get '/users/1/posts'
    end

    it 'render the correct template' do
      expect(response).to render_template(:index)
    end

    it 'the response includes right text' do
      expect(response.body).to include('Index page from posts')
    end

    it 'the right response status' do
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /show' do
    before :each do
      get '/users/1/posts/2'
    end
    it 'renders the right template' do
      expect(response).to render_template(:show)
    end

    it 'the response includes right text' do
      expect(response.body).to include('show page from posts')
    end

    it 'the correct response status' do
      expect(response.status).to eq(200)
    end
  end
end
