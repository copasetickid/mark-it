class PagesController < ApplicationController

  def home
    redirect_to bookmarks_path if user_signed_in?
  end
end
