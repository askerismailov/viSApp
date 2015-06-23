class Contragent < ActiveRecord::Base

  has_many :bank_accounts
  belongs_to :cont_type

end
