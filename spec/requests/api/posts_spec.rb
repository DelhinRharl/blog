require 'swagger_helper'

RSpec.describe 'api/posts', type: :request do
  describe 'Blog API' do
    path '/api/v1/posts' do
      post 'Creates a post' do
        tags 'posts'
        consumes 'application/json'
        parameter name: :posts, in: :body, schema: {
          type: :object,
          properties: {
            title: { type: :string },
            text: { type: :string }
          },
          required: %w[title text]
        }

        response '201', 'post created' do
          let(:posts) { { title: 'foo', text: 'bar' } }
          run_test!
        end

        response '422', 'invalid request' do
          let(:posts) { { title: 'foo' } }
          run_test!
        end
      end
    end
  end
end
