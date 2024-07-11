class CreateCoffeePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :coffee_posts do |t|
      t.references :shop, null: false, foreign_key: true
      t.string :name, null: false
      t.text :introduction, null: false
      t.boolean :online_sale, null: false, default: false
      t.integer :brewing, null: false, default: 0
      t.integer :roasting, null: false, default: 0
      t.integer :grind_size, null: false, default: 0
      t.integer :sweetness, null: false, default: 0
      t.integer :acidity, null: false, default: 0
      t.integer :bitterness, null: false, default: 0
      t.integer :strength, null: false, default: 0
      t.integer :aftertaste, null: false, default: 0
      t.text :supplement

      t.timestamps
    end
  end
end
