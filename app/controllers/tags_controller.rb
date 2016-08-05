class TagsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users_tag = Tag.user_tags(current_user)
  end
end
