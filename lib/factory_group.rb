require "factory_group/version"
require "factory_group/group"

module FactoryGroup
  def self.define(name, &block)
    Group.new.instance_eval(&block)
  end
end
