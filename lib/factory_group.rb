require "factory_group/version"
require "factory_group/configuration"

module FactoryGroup
  def self.define(:name, &block)
    Factory.new.instance_eval do
      yield(block)        
    end 
  end

  def self.register(name)

  end

  def self.find(name)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  class << self
    delegate :groups, to: :configuration
  end

end
