require "spec_helper"

describe FactoryGroup do
  let(:facory_group_definition) { FactoryGroup.define(:user_group) {"definition"} }

  it "returns the result of evaluating the block passed to define method" do
    expect(facory_group_definition).to eq "definition"
  end
end
