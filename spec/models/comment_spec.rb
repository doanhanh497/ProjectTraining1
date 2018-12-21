require "rails_helper"

RSpec.describe Comment, type: :model do
  let!(:parent_comment) { FactoryBot.create(:comment, parent_id: nil) }
  let!(:not_parent_comment) { FactoryBot.create(:comment, parent_id: parent_comment.id) }

  describe "Associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:course) }
  end

  describe "Delegate" do
    it { is_expected.to delegate_method(:name).to(:user).with_prefix(:user) }
    it { is_expected.to delegate_method(:avatar).to(:user).with_prefix(:user) }
  end
  
  describe "Scope" do
    context "parent_comment?" do
      it "is parent comment" do
        expect(Comment.parent_comment?).to include parent_comment
      end
      it "isnot parent comment" do
        expect(Comment.parent_comment?).to_not include not_parent_comment
      end
    end

    context "user_comment_course" do
      pending "Not unit test"
    end
  end

  describe "#comment_child?" do
    it "find all comment child" do
      expect(parent_comment.comment_child?).to include not_parent_comment
    end
  end
end
