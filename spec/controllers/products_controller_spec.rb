require 'rails_helper'

describe ProductsController, :type => :controller do

  before do
    @product = FactoryGirl.create(:product)
    @admin = FactoryGirl.create(:admin)
    @user = FactoryGirl.create(:user)
  end

  describe "GET #index" do
    it "shows all products" do
      get :index
      expect(response).to have_http_status(200)
      expect(assigns(:products)).to eq Product.all
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      get :show, params:{id: @product.id}
      expect(response).to render_template :show
    end

    it "shows correct product" do
      get :show, params:{id: @product.id}
      expect(response).to have_http_status(200)
      expect(assigns(:product)).to eq @product
    end
  end

  describe "GET #new" do

    context "User not admin logged in" do
      before do
        sign_in @user
      end
      it "redirects to root_path" do
        get :new, params: {id: @user.id}
        expect(response).to redirect_to(root_path)
      end
    end

    context "Admin logged in" do
      before do
        sign_in @admin
      end
      it "renders the new template" do
        get :new, params:{id: @admin.id}
        expect(response).to have_http_status(200)
        expect(response).to render_template :new
      end
    end

  end

  describe "GET #edit" do

    context "Admin logged in" do
      before do
        sign_in @admin
      end
      
      it "renders the edit template" do
        get :edit, params:{id: @admin.id}
        expect(response).to have_http_status(200)
        expect(response).to render_template :edit
      end
    end

  end

  describe "Post #create" do
    before do
      sign_in @admin
    end

    context "create valid product then redirect to product page"

      subject {post :create, product: FactoryGirl.attributes_for(:product)}

        it 'creates a new product' do
          expect{subject}.to change(Product, :count).by(1)
        end

        it "redirects to product page" do
          post :create, product: FactoryGirl.attributes_for(:product)
          expect(response).to have_http_status(302)
          expect(response).to redirect_to(product_path(Product.last))
        end

  end

  describe "PUT #update" do
    before do
      sign_in @admin
    end

    context "valid attributes" do

      it "located the requested @product" do
        put :update, id: @product, product: FactoryGirl.attributes_for(:product)
        expect(assigns(:product)).to eq(@product)
      end

      it "changes attributes of @product" do
        put :update, id: @product, product:\
        FactoryGirl.attributes_for(:product, name: "updated_product", description:"updated_product")
        @product.reload
        expect(@product.name).to eq("updated_product")
      end

      it "redirects to updated product" do
        put :update, id: @product, product:\
        FactoryGirl.attributes_for(:product, name: "updated_product", description:"updated_product")

        expect(response).to have_http_status(302)
        expect(response).to redirect_to(products_path)
      end
    end
  end

  describe "DELETE #destroy" do

    it "deletes product" do
      delete :destroy, params: {id: @product.id}
      expect{@product.destroy}.to change(Product, :count).by(-1)

    end
  end

end
