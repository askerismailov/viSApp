class CreateContragents < ActiveRecord::Migration
  def change
    create_table :contragents do |t|

      t.timestamps null: false
    end
  end
end
