require 'rails_helper'

RSpec.describe Person, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }

    describe "email" do
      it { is_expected.to validate_presence_of(:email) }

      it "is valid when email address is real" do
        subject.email = Faker::Internet.email
        subject.validate
        expect(subject.errors[:email]).to be_empty
      end

      it "is invalid when email is garbage" do
        subject.email = Faker::Name.name
        subject.validate
        expect(subject.errors[:email]).to include("is invalid")
      end
    end
  end

  describe "#slug" do
    it "returns the parameterized name" do
      person = create(:person, name: "Rebecca Miller-Webster")

      expect(person.slug).to eq("rebecca-miller-webster")
    end
  end
end
