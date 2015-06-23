class CreateContTypes < ActiveRecord::Migration
  def up
    create_table :cont_types do |t|
      t.string :cont_type
    end
  end

  def down
    drop_table :cont_types
  end
end
