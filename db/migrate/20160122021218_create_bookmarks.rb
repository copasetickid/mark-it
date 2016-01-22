class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.string :uri
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
