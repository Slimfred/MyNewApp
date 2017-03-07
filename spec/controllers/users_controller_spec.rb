require 'rails_helper'

describe UsersController, :type => :controller do
  before do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
  end

  describe "GET#show" do
    context "User logged in" do
      before do
        sign_in @user
      end
      it "loads correct user detail" do
        get :show, params: {id: @user.id}
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end

    end

    context "No user logged in" do
      it "redirects to login" do
        get :show, params: {id: @user.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "user trys to access another users info" do
      before do
        sign_in @user
      end
      it "redirects to root_path" do
        get :show, params: {id: @user2.id}
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
