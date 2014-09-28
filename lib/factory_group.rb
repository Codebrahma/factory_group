require "factory_group/version"
require "factory_group/group"
require "factory_group/exceptions/factory_group_not_defined"

module FactoryGroup
  @registry = {}

  def self.registry
    @registry
  end

  def self.define(name, &block)
    group = Group.new
    group.instance_eval(&block)
    FactoryGroup.registry[name] = group
  end

  def self.create(name)
    raise Exceptions::FactoryNotDefined if !registry[name]
    factory_group = registry[name].dup
    factory_group.factories
  end
end
