require 'rails_helper'

describe Product do
  context "when the product has comments" do
    before do
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.create(:user)
      @product.comments.create!(rating: 1, user: @user, body: "ewwww")
      @product.comments.create!(rating: 5, user: @user, body: "Yummy!")
      @product.comments.create!(rating: 3, user: @user, body: "not bad")
    end
    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eql (3.0)
    end
    it "is not valid" do
      expect(Product.new(description: "peanut butter")).not_to be_valid
    end
  end
end
