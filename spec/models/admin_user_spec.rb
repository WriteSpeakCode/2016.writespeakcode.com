require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe "associations" do
    it { should belong_to(:person) }
  end
end
