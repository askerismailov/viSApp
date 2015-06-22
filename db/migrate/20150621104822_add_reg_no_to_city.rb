class AddRegNoToCity < ActiveRecord::Migration
  def change
    add_column("cities", "city_reg_no", :integer, :limit => 8,
                                        :after => "id")
  end
end
