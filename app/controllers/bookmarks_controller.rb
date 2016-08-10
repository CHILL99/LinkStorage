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
      redirect_to authenticated_root_path, notice: 'Bookmark successfully created'
    else
      flash[:error] = 'Some errors prohibited this bookmark from being saved'
      render :new
    end
  end

  def edit
  end

  def update
    if @bookmark.update(bookmark_params)
      redirect_to authenticated_root_path, notice: 'Bookmark successfully updated'
    else
      flash[:error] = 'Some errors prohibited this bookmark from being saved'
      render :edit
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path, notice: 'Bookmark successfully deleted'
  end

  private
    def bookmark_params
      params.require(:bookmark).permit(:content, :description, :all_tags)
    end

    def load_bookmark
      @bookmark = current_user.bookmarks.find(params[:id])
    end
end
