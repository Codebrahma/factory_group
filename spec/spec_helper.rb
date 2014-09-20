require "codeclimate-test-reporter"

CodeClimate::TestReporter.start

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH << File.join(File.dirname(__FILE__))

require 'rubygems'
require 'rspec'
require 'debugger'

require 'factory_group'

RSpec.configure do |config|
  
end
