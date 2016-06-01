require 'rails_helper'

describe TalkSpeaker do
  describe "associations" do
    it { is_expected.to belong_to(:talk) }
    it { is_expected.to belong_to(:person) }
  end
end
