# frozen_string_literal: true

describe BooksAutocompleteController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/books_autocomplete').to route_to('books_autocomplete#index')
    end
  end
end
