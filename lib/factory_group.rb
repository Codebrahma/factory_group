require "factory_group/version"
require "factory_group/configuration"
require "factory_group/group"

module FactoryGroup
  def self.define(name, &block)
    Group.new.instance_eval(&block)
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
