class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :bookmark
      t.string :description

      t.timestamps null: false
    end
  end
end
