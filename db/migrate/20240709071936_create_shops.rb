class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.references :maker, null: false, foreign_key: true
      t.string :name, null: false
      t.string :address
      t.text :introduction
      t.string :website

      t.timestamps
    end
  end
end
