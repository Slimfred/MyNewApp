require 'rails_helper'

describe Comment do
  context "when required fields not present" do
    it "is not valid" do
      expect(Comment.new(user_id: 1, product_id: 1, body: "yummy")).not_to be_valid
      expect(Comment.new(user_id: 1, product_id: 1, rating: 3)).not_to be_valid
    end
  end
end
