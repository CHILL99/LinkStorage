module TagsHelper
  def user_tag_links(tags)
    tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip)}.uniq.join(", ") 
  end
end
