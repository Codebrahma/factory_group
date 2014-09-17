require "factory_group/version"
require "factory_group/group"

module FactoryGroup
  @registry = {}

  def self.registry
    @registry
  end

  def self.define(name, &block)
    group = Group.new
    FactoryGroup.registry[name] = group.instance_eval(&block)
  end
end
