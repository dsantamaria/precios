class Usuario < ActiveRecord::Base
  attr_accessible :lastlogin, :login, :pass
  
  validates :login,  :presence => true
  validates :pass, :presence => true,
                      :length => { :minimum => 5 }
end
