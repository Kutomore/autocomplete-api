# frozen_string_literal: true

class Book < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates_presence_of :title, :publisher, :author, :genre, :published_at

  mapping dynamic: :strict do
    indexes :reference, type: 'text'
    indexes :suggest, {
      type: 'completion',
      analyzer: 'simple',
      search_analyzer: 'simple'
    }
  end

  def as_indexed_json(_options = nil)
    {
      reference: "#{author} (#{published_at.year}). #{title}. #{publisher}.",
      suggest: {
        input: [author, published_at, title, publisher, genre]
      }
    }
  end

  def self.auto_complete(q)
    return nil if q.blank?

    search_definition = {
      suggest: {
        'reference-suggest' => {
          prefix: q,
          completion: {
            field: 'suggest'
          }
        }
      }
    }

    __elasticsearch__.client.perform_request(
        'POST',
        "#{index_name}/_search?pretty",
        {},
        search_definition
    ).body['suggest']['reference-suggest'].first["options"]
  end
end
