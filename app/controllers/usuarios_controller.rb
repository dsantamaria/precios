class UsuariosController < ApplicationController
  
  def index 
      @usuarios = Usuario.all(:conditions => "email!='" + current_usuario.email + "'")
#      @empresa = Empresa.find(2) 
      #abort(@usuarios.inspect)

 
      respond_to do |format|

        format.html # index.html.erb
        format.json { render json: @usuarios }
      end
  end
  
  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to usuarios_url }
      format.json { head :no_content }
    end
  end
end
