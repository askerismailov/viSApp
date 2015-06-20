class CreateBanks < ActiveRecord::Migration

  def up
    create_table :banks do |t|
      t.integer :city_id
      t.integer :post_index_id
      t.string :mfo_no
      t.string :bank_name
      t.string :cor_account
      t.timestamps null: false
    end
    add_index :banks, ["city_id", "post_index_id"]
  end

  def down
    drop_table :banks
  end

end
