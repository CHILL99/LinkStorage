class TagsController < ApplicationController
  def index
    @users_tag = Tag.user_tags(current_user)
  end
end
