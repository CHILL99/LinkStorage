class TagsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user_tags = current_user.user_tags
  end
  
  def show
    @tag = current_user.user_tags.detect{ |t| t.id == params[:id].to_i }
    @bookmarks = @tag.bookmarks.where(user: current_user)
  end
end
