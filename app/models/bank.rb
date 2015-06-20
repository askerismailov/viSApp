class Bank < ActiveRecord::Base

  belongs_to :post_index
  belongs_to :city

end
