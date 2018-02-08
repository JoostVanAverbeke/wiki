require 'rails_helper'

RSpec.describe Api::V1::AuthorsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/authors').to route_to('api/v1/authors#index')
    end

    it 'routes to #show' do
      expect(get: '/api/v1/authors/1').to route_to('api/v1/authors#show', id: '1')
    end
    
    context 'nested routes' do
      it 'routes to #show_relationship' do
        expect(get: '/api/v1/authors/1/relationships/articles').to route_to('api/v1/authors#show_relationship', relationship: 'articles', author_id: '1')
      end

      it 'routes to #get_related_resources' do
        expect(get: '/api/v1/authors/1/articles').to route_to('api/v1/articles#get_related_resources', relationship: 'articles', source: 'api/v1/authors', author_id: '1')
      end
    end
  end
end
