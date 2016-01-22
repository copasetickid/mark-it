require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  let(:user) { create(:user, :with_bookmarks) }
  let(:bookmark) { create(:bookmark) }

  describe "GET #index" do
    context "logged in users" do

      before :each do
        sign_in user
      end

      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "returns only their bookmarks" do
        get :index
        expect(assigns(:bookmarks)).not_to include bookmark
      end
    end

    context "vistors" do
      it "redirects back to the homepage" do
        get :index
        expect(response).to redirect_to root_path
      end
    end
  end
end
