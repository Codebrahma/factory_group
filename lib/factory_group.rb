require "factory_group/version"
require "factory_group/configuration"

module FactoryGroup
  # Your code goes here...
  def self.define(:name, &block)
  end

  def self.register(:name)
  end

  def self.find(:name)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  class << self
    delegate :groups, to: :configuration
  end

end
