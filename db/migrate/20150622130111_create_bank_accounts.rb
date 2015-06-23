class CreateBankAccounts < ActiveRecord::Migration

  def up
    create_table :bank_accounts do |t|
      t.integer :bank_id
      t.integer :contragent_id
      t.integer :acc_reg_no
      t.string  :bank_account
      t.timestamps null: false
    end
    add_index :bank_accounts, ["bank_id", "contragent_id"]
  end

  def down
    drop_table :bank_accounts
  end

end
