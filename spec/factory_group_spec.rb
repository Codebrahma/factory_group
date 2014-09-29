require "spec_helper"

describe FactoryGroup do

  let!(:factory_group_definition) do
    FactoryGroup.define(:user_group) do
      user "A User"
    end
  end

  context "#define" do
    it "returns a proc that evaluates the block passed to define method" do
      expect(factory_group_definition).to be_an_instance_of Proc
    end

    it "stores the created group in the registry" do
      expect(described_class.registry).to have_key :user_group
    end
  end

  context "#create" do
    context "when a group with the given name is defined" do
      let(:user_group){ described_class.create(:user_group) }
      it "returns the created FactoryGroup::Group instance" do
        expect(user_group).to be_an_instance_of OpenStruct
      end

      it "can be used to access the user variable" do
        expect(user_group.user).to eq "A User"
      end
    end

    context "when a group with the given name is not defined" do
      it "should raise and exception" do
        expect{
          described_class.create(:invalid_user_group)
        }.to raise_exception(FactoryGroup::Exceptions::FactoryGroupNotDefined)
      end
    end

    context "multiple group instances" do
      let(:group_one){ described_class.create(:user_group) }
      let(:group_two){ described_class.create(:user_group) }
      it "should have different object ids" do
        group_one.user = "Another user"
        expect(group_one.user).not_to eq(group_two.user)
      end
    end
  end

end
