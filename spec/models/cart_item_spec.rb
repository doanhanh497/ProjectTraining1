require "rails_helper"

RSpec.describe CartItem, type: :model do
  let!(:cart_item1) { FactoryBot.create :cart_item }
  let!(:cart_item2) { FactoryBot.create :cart_item }
  let!(:course1) { FactoryBot.create :course }
  let!(:course2) { FactoryBot.create :course }

  describe "Associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:course) }
  end

  describe ".total_price" do
    it { expect(CartItem.total_price []).to eq(0) }
    it { expect(CartItem.total_price [cart_item1, cart_item2]).to eq(180000) }
  end

  describe ".total_price_not_login" do
    it { expect(CartItem.total_price []).to eq(0) }
    it { expect(CartItem.total_price_not_login [course1, course2]).to eq(180000) }
  end
end
