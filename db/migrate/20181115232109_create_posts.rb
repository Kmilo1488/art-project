class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :image
      t.text :text
      t.references :owner

      t.timestamps
    end
  end
end
