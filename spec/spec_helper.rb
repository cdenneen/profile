require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet'
require 'rspec-puppet-facts'
require 'rspec-puppet-utils'
#require 'hiera'

include RspecPuppetFacts

require 'simplecov'
require 'simplecov-console'

SimpleCov.start do
  add_filter '/spec'
  add_filter '/.bundle'
  formatter SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::Console
  ])
end

#FIXTURES_PATH = File.expand_path(File.dirname(__FILE__) + '/fixtures')
#$LOAD_PATH.unshift(*Dir["#{FIXTURES_PATH}/modules/*/lib"])
#
#Dir[File.absolute_path(File.dirname(__FILE__) + '/support/*.rb')].each do |f|
#  require f
#end

RSpec.configure do |c|
  c.mock_framework = :rspec
  c.hiera_config = File.expand_path(File.join(__FILE__, '../fixtures/hiera.yaml'))
  c.after(:suite) do
    RSpec::Puppet::Coverage.report!(95)
  end
end

provider_class = Puppet::Type.type(:package).provider(:rpm)
Puppet::Type.type(:package).stubs(:defaultprovider).returns(provider_class)
