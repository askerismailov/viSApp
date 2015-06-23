class CreateContragents < ActiveRecord::Migration

  def up
    create_table :contragents do |t|
      t.integer :cont_reg_no
      t.string  :cont_name
      t.string  :cont_type

      t.timestamps null: false
    end
  end

  def down
    drop_table :contragents
  end
end
