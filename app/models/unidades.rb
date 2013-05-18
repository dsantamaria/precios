class Unidades < ActiveRecord::Base
  attr_accessible :estado, :nombre
  validates :nombre, :presence => { :message => ": Ingrese un valor." }
end
