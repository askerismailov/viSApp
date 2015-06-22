class AddRegNoBank < ActiveRecord::Migration
  def change
    add_column("banks", "bank_reg_no", :integer, :limit => 8,
                                        :after => "id")
  end
end
