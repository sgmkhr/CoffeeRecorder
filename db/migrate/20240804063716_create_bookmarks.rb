class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :coffee_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
