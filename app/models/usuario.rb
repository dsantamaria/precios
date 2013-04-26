class Usuario < ActiveRecord::Base
  attr_accessible :lastlogin, :login, :pass, :pass_confirmation
  
  validates :login,  :presence => true
  validates :pass, :presence => true,
                      :length => { :minimum => 5 }
  validates_confirmation_of :pass
end
