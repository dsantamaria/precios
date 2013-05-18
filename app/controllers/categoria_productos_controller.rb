class CategoriaProductosController < ApplicationController
  # GET /categoria_productos
  # GET /categoria_productos.json
  def index
    @categoria_productos = CategoriaProducto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categoria_productos }
    end
  end

  # GET /categoria_productos/1
  # GET /categoria_productos/1.json
  def show
    @categoria_producto = CategoriaProducto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @categoria_producto }
    end
  end

  # GET /categoria_productos/new
  # GET /categoria_productos/new.json
  def new
    @categoria_producto = CategoriaProducto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @categoria_producto }
    end
  end

  # GET /categoria_productos/1/edit
  def edit
    @categoria_producto = CategoriaProducto.find(params[:id])
  end

  # POST /categoria_productos
  # POST /categoria_productos.json
  def create
    @categoria_producto = CategoriaProducto.new(params[:categoria_producto])

    respond_to do |format|
      if @categoria_producto.save
        format.html { redirect_to @categoria_producto, notice: 'Categoria producto was successfully created.' }
        format.json { render json: @categoria_producto, status: :created, location: @categoria_producto }
      else
        format.html { render action: "new" }
        format.json { render json: @categoria_producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categoria_productos/1
  # PUT /categoria_productos/1.json
  def update
    @categoria_producto = CategoriaProducto.find(params[:id])

    respond_to do |format|
      if @categoria_producto.update_attributes(params[:categoria_producto])
        format.html { redirect_to @categoria_producto, notice: 'Categoria producto was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @categoria_producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoria_productos/1
  # DELETE /categoria_productos/1.json
  def destroy
    @categoria_producto = CategoriaProducto.find(params[:id])
    @categoria_producto.destroy

    respond_to do |format|
      format.html { redirect_to categoria_productos_url }
      format.json { head :no_content }
    end
  end
end
