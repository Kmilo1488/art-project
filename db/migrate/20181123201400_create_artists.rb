class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :review
      t.string :country
      t.integer :region

      t.timestamps
    end
  end
end
