class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.varchar :name
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
