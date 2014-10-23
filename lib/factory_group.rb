require "factory_group/version"
require "factory_group/group"
require "factory_group/exceptions/factory_group_not_defined"

module FactoryGroup
  @registry = {}

  def self.registry
    @registry
  end

  def self.define(name, &block)
    FactoryGroup.registry[name] = Proc.new do |overrides|
      Group.new(overrides).tap{ |g| g.instance_eval(&block) }
    end
  end

  def self.create(name, overrides = {})
    raise Exceptions::FactoryGroupNotDefined if !registry[name]

    factory_group = registry[name].call(overrides)
    factory_group.factories
  end
end
