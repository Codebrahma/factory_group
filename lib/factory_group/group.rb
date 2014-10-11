require "factory_girl"
require "ostruct"

module FactoryGroup
  class Group

    def initialize
      @factories = OpenStruct.new({})
    end

    attr_reader :factories

    # Sets an instance variable with the name as the called method and
    # assigns the args[0] passed to it.
    def method_missing(name, *args, &block)
      # If the args is empty, it means a variable is reused inside the group itself
      evaluvated_result = args.empty? ? @factories.instance_eval(name.to_s) : args[0]

      @factories.send("#{name.to_s}=", evaluvated_result)
    end
  end
end
