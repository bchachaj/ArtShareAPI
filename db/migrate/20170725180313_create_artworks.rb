class CreateArtworks < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks do |t|
      t.text :title, presence: true
      t.integer :artist_id, presence: true


      t.timestamps
    end

    add_index :artworks, [:artist_id, :title]
  end
end
