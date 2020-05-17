class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :surname
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
