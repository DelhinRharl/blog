require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do
  path '/api/v1/comments/create' do
    parameter name: 'X-Token', in: :header, type: :string

    post 'Create a comment' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: ['text']
      }

      response '201', 'comment created' do
        let(:comment) { { text: 'ruby' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:comment) { { text: 'ruby' } }
        run_test!
      end
    end
  end

  path '/api/v1/comments' do
    parameter name: 'X-Token', in: :header, type: :string
    get 'Get all comments' do
      tags 'comments'
      produces 'application/json'

      response '201', 'comments found' do
        # let(:comment) { { text: 'ruby' } }
        let(:'X-Token') { '123' }
        run_test!
      end

      response '404', 'comments not found' do
        let(:comment) { { text: 'rails' } }
        run_test!
      end
    end
  end
end
