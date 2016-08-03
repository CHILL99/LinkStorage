class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :content
      t.string :description
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
