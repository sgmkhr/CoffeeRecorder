class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.references :user, null: false, foreign_key: true
      t.string :coffee_name, null: false
      t.string :shop_name, null: false
      t.integer :scene, null: false, default: 0
      t.integer :brewing, null: false, default: 0
      t.integer :sweetness, null: false, default: 0
      t.integer :acidity, null: false, default: 0
      t.integer :bitterness, null: false, default: 0
      t.integer :strength, null: false, default: 0
      t.integer :aftertaste, null: false, default: 0
      t.text :impression

      t.timestamps
    end
  end
end
