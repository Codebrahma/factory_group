require "factory_group/version"
require "factory_group/group"
require "factory_group/exceptions/factory_group_not_defined"

module FactoryGroup
  @registry = {}

  def self.registry
    @registry
  end

  def self.define(name, &block)
    FactoryGroup.registry[name] = -> {
      Group.new.tap{ |g| g.instance_eval(&block) }
    }
  end

  def self.create(name)
    raise Exceptions::FactoryGroupNotDefined if !registry[name]

    factory_group = registry[name].call
    factory_group.factories
  end
end
