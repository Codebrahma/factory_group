require "spec_helper"

describe FactoryGroup do

  context "#create" do
    describe "with a single basic factory" do
      before do
        described_class.define(:user_group) do
          user FactoryGirl.create(:user)
        end

        @user_group = FactoryGroup.create(:user_group)
      end

      it "should create a factory_group with the factories" do
        expect(@user_group).to be_a OpenStruct
        expect(@user_group.user).to be_a User
        expect(@user_group.user.name).to eq "sample"
        expect(@user_group.user.age).to eq 20
      end
    end

    describe "with a variable inside a group being reused inside the group itself" do
      before do
        described_class.define(:user_group) do
          user FactoryGirl.create(:user)
          name user.name
        end

        @user_group = FactoryGroup.create(:user_group)
      end

      it "should be able to access name attribute" do
        expect(@user_group.name).to eq "sample"
      end
    end

    describe "with a factory overridden" do
      before do
        described_class.define(:user_group) do
          user FactoryGirl.create(:user)
        end

        @overriding_user = FactoryGirl.create(:user, :name => "Overridden Name")
        @user_group = FactoryGroup.create(:user_group, :user => @overriding_user)
      end

      it "should create the user object with the overridden parameters" do
        expect(@user_group.user.name).to eq "Overridden Name"
      end
    end

    describe "with a factory overridden and used at a later point in time" do
      before do
        described_class.define(:user_group) do
          user FactoryGirl.create(:user)
          name user.name
        end

        @overriding_user = FactoryGirl.create(:user, :name => "Overridden Name")
        @user_group = FactoryGroup.create(:user_group, :user => @overriding_user)
      end

      it "should use the overridden user object" do
        expect(@user_group.name).to eq "Overridden Name"
      end
    end
  end
end
