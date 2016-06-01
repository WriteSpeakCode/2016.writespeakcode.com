require 'rails_helper'

describe Talk do
  describe "associations" do
    it { is_expected.to have_many(:talk_speakers) }
    it { is_expected.to have_many(:speakers).through(:talk_speakers).with_foreign_key(:person_id) }
  end

  describe "scopes" do
    describe ".talks" do
      let!(:talk) { create(:talk, session_type: :talk) }
      let!(:panel) { create(:talk, session_type: :panel) }

      it "returns the talks" do
        result = Talk.talks

        expect(result).to include(talk)
      end

      it "doesn't return non-talks" do
        result = Talk.talks

        expect(result).to_not include(panel)
      end
    end

    describe ".keynotes" do
      let!(:keynote) { create(:keynote_talk) }
      let!(:talk) { create(:talk) }

      it "returns keynotes" do
        results = Talk.keynotes

        expect(results).to include(keynote)
      end

      it "doesn't return other talks" do
        results = Talk.keynotes

        expect(results).to_not include(:talk)
      end
    end

    describe ".default_order" do
      let!(:keynote) { create(:keynote_talk) }
      let!(:talk) { create(:talk) }

      it "returns keynotes first" do
        ordered_talks = Talk.all.default_order

        expect(ordered_talks.first.keynote).to be_truthy
      end

      it "returns non keynotes last" do
        ordered_talks = Talk.all.default_order

        expect(ordered_talks.last.keynote).to be_falsey
      end
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:session_type) }
    it { is_expected.to validate_presence_of(:day) }
  end
end
