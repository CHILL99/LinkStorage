class Bookmark < ActiveRecord::Base
  belongs_to :user

  has_many :bookmark_tag_mappings, dependent: :destroy
  has_many :tags, through: :bookmark_tag_mappings

  validates_presence_of :content

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(", ")
  end

end
