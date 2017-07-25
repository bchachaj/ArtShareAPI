class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :commenter_id, presence: true
      t.integer :artwork_id, presence: true
      t.text :body, presence: true

      t.timestamps 
    end
  end
end
