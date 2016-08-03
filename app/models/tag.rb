class Tag < ActiveRecord::Base
  has_many :bookmark_tag_mappings
  has_many :bookmarks, through: :bookmark_tag_mappings
end
