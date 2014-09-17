require "spec_helper"

describe FactoryGroup::Group do
  let(:group) { described_class.new }

  before do
    group.instance_eval do
      user "name"
    end
  end
  it "stores the factories into the factories hash" do
    expect(group.factories).to have_key :user
  end
end
