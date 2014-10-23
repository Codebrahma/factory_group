require "factory_girl"
require "ostruct"

module FactoryGroup
  class Group

    def initialize(overrides = {})
      @factories = OpenStruct.new({})
      @overrides = overrides
    end

    attr_reader :factories, :overrides

    # Sets an instance variable with the name as the called method and
    # assigns the args[0] passed to it.
    def method_missing(name, *args, &block)
      # If the factory is overridden use it.
      return @factories.send("#{name.to_s}=", overrides[name]) if overrides[name].present?

      # If the args is empty, it means a variable is reused inside the group itself
      args.empty? ? @factories.instance_eval(name.to_s) : @factories.send("#{name.to_s}=", args[0])
    end
  end
end
