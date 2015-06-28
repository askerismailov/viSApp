class RenameContTypeToContTypeId < ActiveRecord::Migration
  def change
    rename_column :contragents, "cont_type", "cont_type_id"
  end
end
