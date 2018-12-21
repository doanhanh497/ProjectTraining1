require "rails_helper"

RSpec.describe Rating, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:course) }
  end

  describe "Scope" do
    subject { FactoryBot.create(:rating, rating: 1) }
    context "group_rating?" do
      pending "Not unit test"
    end
  end
end
