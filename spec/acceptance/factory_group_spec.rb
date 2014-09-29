require "spec_helper"

describe FactoryGroup do
  before(:all) do
    described_class.define(:user_group) do
      user FactoryGirl.create(:user)
    end
  end

  context "#create" do
    before do
      @user_group = FactoryGroup.create(:user_group)
    end
    it "should create a factory_group with the factories" do
      expect(@user_group).to be_a OpenStruct
      expect(@user_group.user).to be_a User
      expect(@user_group.user.name).to eq "sample"
      expect(@user_group.user.age).to eq 20
    end
  end
end
