class BankAccount < ActiveRecord::Base

  belongs_to :bank
  belongs_to :contragent

end
