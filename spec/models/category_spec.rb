require "rails_helper"

RSpec.describe Category, type: :model do
  describe "Associations" do
    it { is_expected.to belong_to(:parent).class_name("Category").optional }
    it { is_expected.to have_many(:courses).
      dependent(:destroy) }
    it { is_expected.to have_many(:children).
      dependent(:destroy).
      with_foreign_key("parent_id").
      class_name("Category") }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_uniqueness_of(:description) }
  end

  describe "Scope" do
    pending "Not unit test"
  end

  describe "#load_courses" do
    pending "Not unit test"
  end

  describe "#load_structure" do
    pending "Not unit test"
  end

  describe "#descendents" do
    pending "Not unit test"
  end

  describe "#has_courses?" do
    pending "Not unit test"
  end

  describe "#should_generate_new_friendly_id?" do
    pending "Not unit test"
  end
end
