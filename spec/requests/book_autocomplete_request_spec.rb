# frozen_string_literal: true

describe 'BooksAutocomplete API' do
  path '/books_autocomplete' do
    get 'Retrieves a list of books' do
      tags 'Books'
      produces 'application/json'
      parameter name: :q, in: :query, type: :string, description: 'The string to be completed'

      response '200', 'successful query' do
        schema oneOf: [
          { type: :string, example: 'null' },
          { type: :array, items: {} },
          {
            type: :object,
            properties: {
              text: { type: :string },
              _index: { type: :string },
              _type: { type: :string },
              _id: { type: :string },
              _score: { type: :string },
              _source: {
                type: :object,
                properties: {
                  reference: { type: :string },
                  suggest: {
                    type: :object,
                    properties: {
                      input: {
                        type: :array,
                        items: {
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        ]

        run_test!
      end
    end
  end
end
