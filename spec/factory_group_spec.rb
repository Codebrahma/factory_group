require "spec_helper"

describe FactoryGroup do

  let(:facory_group_definition) do
    FactoryGroup.define(:user_group) do
      user "A User"
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

  context "#create" do
    context "when a group with the given name is defined" do
      it "returns the created FactoryGroup::Group instance" do
        expect(described_class.create(:user_group)).to be_an_instance_of OpenStruct
      end

      it "can be used to access the user variable" do
        expect(described_class.create(:user_group).user).to eq "A User"
      end
    end

    context "when a group with the given name is not defined" do
      it "should raise and exception" do
        expect{
          described_class.create(:invalid_user_group)
        }.to raise_exception(FactoryGroup::Exceptions::FactoryNotDefined)
      end
    end
  end

end
