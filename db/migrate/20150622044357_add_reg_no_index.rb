class AddRegNoIndex < ActiveRecord::Migration
  def change
    add_column("post_indices", "index_reg_no", :integer, :limit => 8,
                                        :after => "id")
  end
end
