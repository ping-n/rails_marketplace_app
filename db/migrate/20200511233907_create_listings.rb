class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.varchar :name
      t.varchar :brand
      t.decimal :price
      t.integer :condition
      t.boolean :sold
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
