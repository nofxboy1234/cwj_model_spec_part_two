require 'test_helper'
class UserTest < ActiveSupport::TestCase

  let(:user) { FactoryBot.build :user}

  subject { FactoryBot.build(:user) }

  context "fresh instance" do
    it { should be_valid }
  end

  it "can be saved" do
    assert_difference "User.count", 1 do
      user.save
    end
    assert user.persisted?
  end

  describe "won't be valid" do
    it "with an duplicated email" do
      user.save
      user2 = FactoryBot.build :user
      user2.wont_be :valid?
      user2.errors.count.must_equal 1
      user2.errors[:email].must_equal ["has already been taken"]
    end

    it "without an email" do
      user.email = nil
      value(user).wont_be :valid?
      user.errors[:email].first.must_equal "can't be blank"
    end

    it "with an falsy email" do
      user.email = "thisis@falsemail"
      value(user).wont_be :valid?
      user.errors[:email].first.must_equal "is invalid"
    end

    it "with an email without a mx-record" do
      user.email = "hi@thisdomainwillneverexistnorhaveamxrecord.com"
      value(user).wont_be :valid?
      user.errors[:email].first.must_equal "is invalid"
    end

    it "with an email that is on our blacklist" do
      user.email = "test@trashmail.com"
      value(user).wont_be :valid?
      user.errors[:email].first.must_equal "is a blacklisted email provider"
    end
  end
end