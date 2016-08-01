class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end
  
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new (bookmark_params)
    @bookmark.save
    redirect_to bookmarks_path
  end

  private
    def bookmark_params
      params.require(:bookmark).permit(:bookmark, :description, :all_tags)
    end
end
