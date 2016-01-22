class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :project_lookup, only: [:edit, :show, :update]


  def index
    @bookmarks = current_user.bookmarks
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark has been created."
      redirect_to @bookmark
    else
      flash.now[:alert] = "Bookmark has not been created."
      render "new"
    end
  end

  def edit
  end

  def show
  end

  def update
    if @bookmark.update(bookmark_params)
       flash[:notice] = "Bookmark has been updated."
       redirect_to @bookmark
    else
      flash.now[:alert] = "Bookmark has not been updated."
      render "edit"
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:title, :uri)
  end

  def project_lookup
    @bookmark = Bookmark.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The bookmark you were looking for could not be found."
    redirect_to bookmarks_path
  end
end
