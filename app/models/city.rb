class City < ActiveRecord::Base

  has_many :banks
  has_many :post_indices

end
