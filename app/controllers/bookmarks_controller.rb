class BookmarksController < ApplicationController
  def index
    @bookmarks = if params[:tag]
      current_user.bookmarks.tagged_with(params[:tag], current_user)
    else
      current_user.bookmarks
    end
  end
  
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new (bookmark_params)
    @bookmark.user = current_user
    if @bookmark.save
      redirect_to bookmarks_path
    else
      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    render :edit
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.update(bookmark_params)
    redirect_to bookmarks_path
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_path
  end

  private
    def bookmark_params
      params.require(:bookmark).permit(:content, :description, :all_tags)
    end
end
