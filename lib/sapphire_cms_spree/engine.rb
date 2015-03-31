module SapphireCmsSpree
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'sapphire_cms_spree'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    initializer 'sapphire_cms_rails_spree.allow_anonymous_get' do
      Spree::Api::Config[:requires_authentication] = false
    end

    config.to_prepare &method(:activate).to_proc
  end
end
