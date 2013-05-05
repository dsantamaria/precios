class UsuariosController < ApplicationController
  def index
  @usuarios = Usuario.all
  
  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @usuarios }
  end
  end
end
