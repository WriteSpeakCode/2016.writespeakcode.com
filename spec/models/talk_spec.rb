require 'rails_helper'

describe Talk do
  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:session_type) }
    it { is_expected.to validate_presence_of(:day) }
  end
end
