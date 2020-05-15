class AddDesciptionToListing < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :description, :text
  end
end
