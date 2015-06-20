class PostIndex < ActiveRecord::Base

  belongs_to :city
  has_many :banks

end
