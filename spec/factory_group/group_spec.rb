require "spec_helper"

describe FactoryGroup::Group do
  let(:group) { described_class.new }

  before do
    group.instance_eval do
      user "name"
    end
  end
  it "should set an instance variable" do
    expect(group.instance_variable_get(:@user)).to eq "name"
  end
end
