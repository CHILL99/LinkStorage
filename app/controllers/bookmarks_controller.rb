class BookmarksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_bookmark, only: [:edit, :update, :destroy]
  
  def index
    @bookmarks = current_user.bookmarks
  end
  
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new (bookmark_params)
    @bookmark.user = current_user
    if @bookmark.save
      redirect_to bookmarks_path, notice: 'Bookmark created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to bookmarks_path, notice: 'Bookmark updated'
    else
      render :edit
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path
  end

  private
    def bookmark_params
      params.require(:bookmark).permit(:content, :description, :all_tags)
    end

    def load_bookmark
      @bookmark = current_user.bookmarks.find(params[:id])
    end
end
