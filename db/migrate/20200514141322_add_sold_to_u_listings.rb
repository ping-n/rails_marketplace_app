class AddSoldToUListings < ActiveRecord::Migration[6.0]
  def up
    change_column :listings, :sold, :boolean, default: false
  end
end
