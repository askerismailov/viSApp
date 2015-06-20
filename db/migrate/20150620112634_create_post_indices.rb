class CreatePostIndices < ActiveRecord::Migration

  def up
    create_table :post_indices do |t|
      t.integer :city_id
      t.integer :post_index
      t.timestamps null: false
    end
    add_index("post_indices", "city_id")
  end

  def down
    drop_table :post_indices
  end

end
