class Tag < ActiveRecord::Base
  has_many :bookmark_tag_mappings
  has_many :bookmarks, through: :bookmark_tag_mappings
  scope :user_tags, -> (user) { user.bookmarks.map{|bookmark| bookmark.all_tags}.join(", ")}
end
