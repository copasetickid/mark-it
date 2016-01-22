require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #home" do
  	context "Users" do
	    it "returns http success" do
	      get :home
	      expect(response).to have_http_status(:success)
	    end
	  end

    context "Authenticated users" do
      let(:user) { create(:user) }

      before do
        sign_in user
      end
      it "redirects users to the Bookmarks page" do
        get :home
        expect(response).to redirect_to bookmarks_path
      end
    end
  end
end
