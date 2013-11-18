# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

for a in 0..20
	Producto.create(:concentracion_ing_activo => "Prueba Producto #{a}", :estado=> "", :proveedor_id=> "", :categoria_producto_id=> "" ,:ingrediente_activo=> "Prueba Producto #{a}", :nombre=> "Prueba Producto #{a}", :precio=> "5555", :ultimo_update=> "",
  :tipo_formula=> "Prueba Producto #{a}", :cantidad_unitaria=> "Prueba Producto #{a}", :unidad=> "Prueba Producto #{a}", :empaque_unitario=> "Prueba Producto #{a}", :precio_unitario=> "555")
	p a
end