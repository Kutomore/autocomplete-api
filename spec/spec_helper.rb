# frozen_string_literal: true
require 'elasticsearch/extensions/test/cluster'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # Apparently testing elastic on docker is currently bugged, and I was unable
  # to find a proper fix for it, so I'll have to leave this untested
  #
  # test_cluster_config = {
  #     port: 9200,
  #     number_of_nodes: 1,
  #     timeout: 120,
  #     network_host: '_local_',
  #     cluster_name: 'docker-cluster'
  # }
  #
  # cluster = Elasticsearch::Extensions::Test::Cluster.start(test_cluster_config)
  #
  # config.before :all, elasticsearch: true do
  #   cluster.start unless cluster.running?
  #   ActiveRecord::Base.descendants.each do |model|
  #     if model.respond_to?(:__elasticsearch__)
  #       begin
  #         model.__elasticsearch__.create_index!
  #         model.__elasticsearch__.refresh_index!
  #       rescue Elasticsearch::Transport::Transport::Errors::NotFound => e
  #         # This kills "Index does not exist" errors being written to console
  #         # by this: https://github.com/elastic/elasticsearch-rails/blob/738c63efacc167b6e8faae3b01a1a0135cfc8bbb/elasticsearch-model/lib/elasticsearch/model/indexing.rb#L268
  #       rescue => e
  #         STDERR.puts "There was an error creating the elasticsearch index for #{model.name}: #{e.inspect}"
  #       end
  #     end
  #   end
  # end
  #
  # # Stop elasticsearch cluster after test run
  # config.after :suite do
  #   ActiveRecord::Base.descendants.each do |model|
  #     if model.respond_to?(:__elasticsearch__)
  #       begin
  #         model.__elasticsearch__.delete_index!
  #       rescue Elasticsearch::Transport::Transport::Errors::NotFound => e
  #         # This kills "Index does not exist" errors being written to console
  #         # by this: https://github.com/elastic/elasticsearch-rails/blob/738c63efacc167b6e8faae3b01a1a0135cfc8bbb/elasticsearch-model/lib/elasticsearch/model/indexing.rb#L268
  #       rescue => e
  #         STDERR.puts "There was an error removing the elasticsearch index for #{model.name}: #{e.inspect}"
  #       end
  #     end
  #   end
  #   cluster.stop if cluster.running?
  # end
end
