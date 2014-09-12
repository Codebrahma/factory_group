require "factory_girl"

module FactoryGroup
  class FactoryGroup

    def initialize
      @factories = {}
    end

    attr_reader :factories

    def method_missing(name, *args, &block)
      puts "#{name} called in and the args are #{args.inspect}"
    end
  end
end
