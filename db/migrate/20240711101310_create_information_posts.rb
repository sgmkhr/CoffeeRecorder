class CreateInformationPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :information_posts do |t|
      t.references :shop, null: false, foreign_key: true
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
