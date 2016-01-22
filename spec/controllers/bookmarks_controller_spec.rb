require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  let(:user) { create(:user, :with_bookmarks) }
  let(:bookmark) { create(:bookmark) }

  describe "GET #index" do
    context "logged in users" do

      before  do
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

  describe "GET #show" do 
    context "logged in users" do
      let(:news_site) { create(:bookmark, title: "News", user: user ) }

      before  do
        sign_in user
      end

      it "handles a missing bookmark correctly" do
        get :show, id: "not-here"
        expect(response).to redirect_to(bookmarks_path)

        message = "The bookmark you were looking for could not be found."
        expect(flash[:alert]).to eq message
      end

      it "renders a user's bookmark" do 
        get :show, id: news_site.id
        expect(response).to be_success
        expect(assigns(:bookmark)).to eq news_site
      end

      

    end
  end

  describe "POST #create" do 
    context "logged in users" do 

      before do 
        sign_in user 
      end

      it "can create a bookmark, but not tag them" do
        post :create, bookmark: { title: "Adele", uri: "http://adele.com" }
        expect(Bookmark.last.tags).to be_empty
      end

       it "can create  a bookmark, with tags" do
        post :create, bookmark: { title: "Adele", uri: "http://adele.com", tag_names: "Soul, Pop" }
        expect(Bookmark.last.tags).to_not be_empty
      end

      it "assigns to the current user as the author" do
        post :create, bookmark: { title: "Adele", uri: "http://adele.com", tag_names: "Soul, Pop" }
        expect(Bookmark.last.user).to eq user
      end
    end

      context "vistors" do
      it "redirects back to the homepage" do
        post :create, bookmark: { title: "Adele", uri: "http://adele.com", tag_names: "Soul, Pop" }
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "PUT #update" do 
    let(:existing_bookmark) { create(:bookmark, user: user) }

    context "logged in users" do 
      before do 
        sign_in user 
      end

      it "allows them to update a bookmark with valid params" do 
        patch :update, bookmark: { title: "Adele - fan site" }, id: existing_bookmark
        existing_bookmark.reload
        expect(flash[:notice]).to eq "Bookmark has been updated."
        should redirect_to bookmark_path(existing_bookmark)
      end

      it "does not update the bookmark with missing params" do
        patch :update, bookmark: { title: "" }, id: existing_bookmark.id
        expect(flash[:alert]).to eq "Bookmark has not been updated."
        should render_template "edit"
      end
    end
  end

  describe "DELETE #destroy" do 
    let(:existing_bookmark) { create(:bookmark, user: user) }

    context "logged in users" do 
      before do 
        sign_in user
      end

      it "allows them to delete a bookmark" do
        delete :destroy, id: existing_bookmark.id 
        expect(flash[:notice]).to eq "Bookmark has been deleted."
        should redirect_to bookmarks_path
      end
    end
  end

end
