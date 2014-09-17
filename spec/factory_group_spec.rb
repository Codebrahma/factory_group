require "spec_helper"

describe FactoryGroup do
  let(:facory_group_definition) do
    FactoryGroup.define(:user_group) do
      definition "definition"
    end
  end

  context "#define" do
    it "returns the result of evaluating the block passed to define method" do
      expect(facory_group_definition).to be_an_instance_of FactoryGroup::Group
    end

    it "stores the created group in the registry" do
      expect(described_class.registry).to have_key :user_group
    end
  end

end
