class CreateListingsShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :listings_shopping_carts do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :shopping_cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
