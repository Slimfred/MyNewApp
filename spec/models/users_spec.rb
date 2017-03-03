require 'rails_helper'

describe User do
  context "when email is blank or invalid" do
    it "is not valid" do
      expect(User.new(password: "cookies")).not_to be_valid
      expect(User.new(email: "fred", password: "cookies")).not_to be_valid
    end
  end
end
