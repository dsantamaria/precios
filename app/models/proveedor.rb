require 'valid_email'

class Proveedor < ActiveRecord::Base
  attr_accessible :direccion, :estado, :nombre, :telefono, :email
  validates :direccion, :nombre, :telefono, :email, :presence => { :message => ": Ingrese un valor." }
  validates :email, :uniqueness => { :message => ": Esta direccion de correo ya se encuentra registrada." }, :email => { :message => ": Ingrese un correo valido."}
  has_many :productos
end
