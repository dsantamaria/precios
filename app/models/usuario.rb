class Usuario < ActiveRecord::Base
  attr_accessible :lastlogin, :login, :pass
end
