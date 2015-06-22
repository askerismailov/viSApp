class City < ActiveRecord::Base
  has_many :banks
  has_many :post_indices

  validates_presence_of :city_name, :message => "HEELLOOO!"

end
