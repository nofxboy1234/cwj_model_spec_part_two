require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.build(:user) }

  context "fresh instance" do
    it { should be_valid }
  end

  context "when email is not unique" do
    let!(:other_user) { FactoryBot.create(:user, email: subject.email) }

    it "is not valid" do
      expect(subject.errors[:email]).to eq(["has already been taken"])
    end
  end

  context "without an email" do
    it "is not valid" do
      subject.email = nil
      subject.save
      expect(subject.errors[:email]).to include("can't be blank")
    end
  end

  context "with an invalid email" do
    it "is not valid" do
      subject.email = "thisis@falsemail"
      subject.save
      expect(subject.errors[:email]).to include("is invalid")
    end
  end

  context "with an email without a mx-record" do
    it "is not valid" do
      subject.email = "hi@thisdomainwillneverexistnorhaveamxrecord.com"
      subject.save
      expect(subject.errors[:email]).to include("is invalid")
    end
  end

  context "with an email that is on our blacklist" do
    it "is not valid" do
      subject.email = "test@trashmail.com"
      subject.save
      expect(subject.errors[:email]).to include("is a blacklisted email provider")
    end
  end
end