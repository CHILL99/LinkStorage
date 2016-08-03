class Bookmark < ActiveRecord::Base
  belongs_to :user
  
  has_many :bookmark_tag_mappings, dependent: :destroy
  has_many :tags, through: :bookmark_tag_mappings
  
  validates :content, presence: true

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name, current_user)
    Tag.find_by_name!(name).bookmarks.where(user_id: current_user.id)
  end

end
