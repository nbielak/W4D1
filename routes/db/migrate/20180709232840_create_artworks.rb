class CreateArtworks < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks do |t|
      t.string :title, null: false, unique: true
      t.string :image_url, null: false
      t.integer :artist_id, null: false, unique: true

      t.timestamps
    end

    add_index :artworks, :artist_id, unique: true
  end
end
