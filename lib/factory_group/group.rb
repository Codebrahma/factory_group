require "factory_girl"

module FactoryGroup
  class Group

    def initialize
      @factories = {}
    end

    attr_reader :factories

    # Sets an instance variable with the name as the called method and
    # assigns the args[0] passed to it.
    def method_missing(name, *args, &block)
      instance_variable_set( "@" + name.to_s, args[0])
    end
  end
end