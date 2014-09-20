require "spec_helper"

describe FactoryGroup::Group do
  let(:group) { described_class.new }

  before do
    group.instance_eval do
      user "name"
    end
  end
  it "responds to the user method" do
    expect(group.factories).to respond_to :user
  end
end
