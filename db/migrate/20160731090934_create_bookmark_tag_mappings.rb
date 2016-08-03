class CreateBookmarkTagMappings < ActiveRecord::Migration
  def change
    create_table :bookmark_tag_mappings do |t|
      t.belongs_to :bookmark, index: true, foreign_key: true
      t.belongs_to :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
