//
//  SubirInfo.swift
//  Florez
//
//  Created by bodgar jair espinosa miranda on 19/11/18.
//  Copyright © 2018 bodgar jair espinosa miranda. All rights reserved.
//

import Foundation
//import Firebase
//import FirebaseDatabase
/**/

class SubirInfo{
    
    private static let _instance = SubirInfo()
    
    static var Instance: SubirInfo {
        return _instance
    }
    
    /*var dbRef: DatabaseReference {
        return Database.database().reference()
    }
    
    var tablaUsuario: DatabaseReference {
        return dbRef.child(Constantes.TABLA_USUARIOS)
    }
    
    var tablaTendencias: DatabaseReference {
        return dbRef.child(Constantes.TABLA_TENDENCIAS)
    }
    
    var tablaFlorDia: DatabaseReference {
        return dbRef.child(Constantes.TABLA_FLOR_DEL_DIA)
    }
    
    var tablaFlores: DatabaseReference {
        return dbRef.child(Constantes.TABLA_FLORES)
    }
    
    var tablaCategorias: DatabaseReference {
        return dbRef.child(Constantes.TABLA_CATEGORIAS)
    }
    
    var tablaArreglosFlores: DatabaseReference {
        return dbRef.child(Constantes.TABLA_ARREGLOS_FLORALES)
    }
    
    var tablaDirecciones: DatabaseReference {
        return dbRef.child(Constantes.TABLA_DIRECCIONES)
    }
    
    var tablaPedidos: DatabaseReference {
        return dbRef.child(Constantes.TABLA_PEDIDOS)
    }
    
    var tablaFactura: DatabaseReference {
        return dbRef.child(Constantes.TABLA_FACTURA)
    }
    
    var tablaValoraciones: DatabaseReference {
        return dbRef.child(Constantes.TABLA_VALORACIONES)
    }
    
    var tablaFavoritos: DatabaseReference {
        return dbRef.child(Constantes.TABLA_FAVORITOS)
    }
    
    var tablaTopDiez: DatabaseReference {
        return dbRef.child(Constantes.TABLA_TOP_10)
    }
    
    var tablaGananciasMensuales: DatabaseReference {
        return dbRef.child(Constantes.TABLA_GANANCIAS_MENSUALES)
    }
    
    var tablaGananciasTotales: DatabaseReference {
        return dbRef.child(Constantes.TABLA_GANANCIAS_TOTALES)
    }
    
    var tablaCostoEnvi: DatabaseReference {
        return dbRef.child(Constantes.TABLA_COSTO_ENVIO)
    }
    
    var tablaTarjetas: DatabaseReference {
        return dbRef.child(Constantes.TABLA_TARJETAS)
    }
    
    var tablaTokens: DatabaseReference {
        return dbRef.child(Constantes.TABLA_TOKENS)
    }
    
    func createToken(token: String, id_user: String){
        let data: [String:Any] = [Constantes.TOKEN: token,
                                  Constantes.ID_USER: id_user]
        tablaTokens.childByAutoId().updateChildValues(data)
    }
    
    func changeCosto(costo: String){
        let data: [String:Any] = [Constantes.COSTO_ENVIO: costo]
        tablaCostoEnvi.updateChildValues(data)
    }
    
    func crearUsuario(tipo: String, telefono: String, nombre: String, correo: String, contrasena: String, id_metodo: String, foto: String, identificacion: String, licencia: String, tipo_navegacion: String, id_user: String, token: String, status: String, codigo: String){
        let data: [String:Any] = [Constantes.TYPE: tipo,
                                  Constantes.PHONE: telefono,
                                  Constantes.NAME: nombre,
                                  Constantes.EMAIL: correo,
                                  Constantes.TOKEN: token,
                                  Constantes.PHOTO: foto,
                                  Constantes.PASSWORD: contrasena,
                                  Constantes.ID_METODO: id_metodo,
                                  Constantes.IDENTIFICACION: identificacion,
                                  Constantes.LICENCIA: licencia,
                                  Constantes.TIPO_NAVEGACION: tipo_navegacion,
                                  Constantes.ID_USER: id_user,
                                  Constantes.STATUS: status,
                                  Constantes.CODIGO: codigo]
        tablaUsuario.child(id_user).updateChildValues(data)
    }
    
    func createTarjeta(id_tarjeta: String, id_usuario: String, terminacion: String){
        let data: [String:Any] = [Constantes.ID_TARJETA: id_tarjeta,
                                  Constantes.ID_USER: id_usuario,
                                  Constantes.TERMINACION: terminacion]
        tablaTarjetas.child(id_usuario).child(id_tarjeta).updateChildValues(data)
    }
    
    func changeCodigo(codigo: String, id_user: String){
        let data: [String:Any] = [Constantes.CODIGO: codigo]
        tablaUsuario.child(id_user).updateChildValues(data)
    }
    
    func changeStatus(status: String, id_user: String){
        let data: [String:Any] = [Constantes.STATUS: status]
        tablaUsuario.child(id_user).updateChildValues(data)
    }
    func changeToken(token: String, id_user: String){
        let data: [String:Any] = [Constantes.TOKEN: token]
        tablaUsuario.child(id_user).updateChildValues(data)
    }
    
    func changeTipoNavegacion(navegacion: String, id_user: String){
        let data: [String:Any] = [Constantes.TIPO_NAVEGACION: navegacion]
        tablaUsuario.child(id_user).updateChildValues(data)
    }
    
    func changeLicencia(licencia: String, id_user: String){
        let data: [String:Any] = [Constantes.LICENCIA: licencia]
        tablaUsuario.child(id_user).updateChildValues(data)
    }
    
    func changeIdentificacion(identificacion: String, id_user: String){
        let data: [String:Any] = [Constantes.IDENTIFICACION: identificacion]
        tablaUsuario.child(id_user).updateChildValues(data)
    }
    
    func changeFoto(foto: String, id_user: String){
        let data: [String:Any] = [Constantes.PHOTO: foto]
        tablaUsuario.child(id_user).updateChildValues(data)
    }
    
    func changeIsDisponible(isDisponible: String, id_user: String){
        let data: [String:Any] = [Constantes.STATUS: isDisponible]
        tablaUsuario.child(id_user).updateChildValues(data)
    }
    
    func changeTipo(tipo: String, id_user: String){
        let data: [String:Any] = [Constantes.TYPE: tipo]
        tablaUsuario.child(id_user).updateChildValues(data)
    }
    
    func changePhone(telefono: String, id_user: String){
        let data: [String:Any] = [Constantes.PHONE: telefono]
        tablaUsuario.child(id_user).updateChildValues(data)
    }
    
    func changeName(name: String, id_user: String){
        let data: [String:Any] = [Constantes.NAME: name]
        tablaUsuario.child(id_user).updateChildValues(data)
    }
    
    func changeCorreo(correo: String, id_user: String){
        let data: [String:Any] = [Constantes.EMAIL: correo]
        tablaUsuario.child(id_user).updateChildValues(data)
    }
    
    func changePass(pass: String, id_user: String){
        let data: [String:Any] = [Constantes.PASSWORD: pass]
        tablaUsuario.child(id_user).updateChildValues(data)
    }
    
    func changeIdMetodo(id_metodo: String, id_user: String){
        let data: [String:Any] = [Constantes.ID_METODO: id_metodo]
        tablaUsuario.child(id_user).updateChildValues(data)
    }
    
    func updateFlorDia(name_flor_dia: String, descripcion_flor_dia: String, id_categoria: String){
        let data: [String:Any] = [Constantes.NAME_FLOR_DIA: name_flor_dia,
                                  Constantes.DESCRIPCION_FLOR_DIA: descripcion_flor_dia,
                                  Constantes.ID_CATEGORIA: id_categoria]
        tablaFlorDia.updateChildValues(data)
    }
    
    func updateImageDia(imagen_flor: String) {
        let data: [String:Any] = [Constantes.PHOTO: imagen_flor]
        tablaFlorDia.updateChildValues(data)
    }
    
    func updateArreglosInTendencia(id_flor: String) {
        let data: [String:Any] = [Constantes.ID_ARREGLO_FLOR: id_flor]
        tablaTendencias.childByAutoId().updateChildValues(data)
    }
    func updateImageTendencia(imagen_flor: String) {
        let data: [String:Any] = [Constantes.PHOTO: imagen_flor]
        tablaTendencias.updateChildValues(data)
    }
    
    func updateCategorias(name_categoria: String, id_categoria: String, imagen_categoria: String, is_flor_dia: Bool){
        let data: [String:Any] = [Constantes.CATEGORIA: name_categoria,
                                  Constantes.ID_CATEGORIA: id_categoria,
                                  Constantes.IMAGEN_CATEGORIA: imagen_categoria,
                                  Constantes.IS_FLOR_DIA: is_flor_dia]
        tablaCategorias.child(id_categoria).updateChildValues(data)
    }
    
    func updateIsFlorDia(id_categoria: String, is_flor_dia: Bool){
        let data: [String:Any] = [Constantes.ID_CATEGORIA: id_categoria,
                                  Constantes.IS_FLOR_DIA: is_flor_dia]
        tablaCategorias.child(id_categoria).updateChildValues(data)
    }
    
    func updateFlores(id_flor: String, name_flor: String, cantidad_flor: String){
        let data: [String:Any] = [Constantes.ID_FLOR: id_flor,
                                  Constantes.NAME_FLOR: name_flor,
                                  Constantes.CANTIDAD_FLOR: cantidad_flor]
        tablaFlores.child(id_flor).updateChildValues(data)
    }
    
    func updateCantidad(id_flor: String, cantidad_flor: String){
        let data: [String:Any] = [Constantes.CANTIDAD_FLOR: cantidad_flor]
        tablaFlores.child(id_flor).updateChildValues(data)
    }
    
    func updateArreglosFlorales(id_Categoria: [String], id_arreglo_flor: String, name_arreglo_flor: String, precio_flor: String, tiempo_elaboracion: String, isExistencia: Bool, descripcion: String, descuento_producto: String, descuento_envio_rapido: String, descuento_envio_super: String, imagen_arreglo: String, is_tendencia: Bool, fecha: String, imagenes_arreglo: [String], inventario: String){
        let data: [String:Any] = [Constantes.ID_CATEGORIA: id_Categoria,
                                  Constantes.ID_ARREGLO_FLOR: id_arreglo_flor,
                                  Constantes.NAME_ARREGLO_FLOR: name_arreglo_flor,
                                  Constantes.PRECIO_FLOR: precio_flor,
                                  Constantes.TIEMPO_ELABORACION: tiempo_elaboracion,
                                  Constantes.ISEXISTENCIA: isExistencia,
                                  Constantes.DESCRIPCION_FLOR: descripcion,
                                  Constantes.DESCUENTO_PRODUCTO: descuento_producto,
                                  Constantes.PRECIO_DESCUENTO_ENVIO_RAPIDO: descuento_envio_rapido,
                                  Constantes.PRECIO_DESCUENTO_ENVIO_SUPER: descuento_envio_super,
                                  Constantes.PHOTO: imagen_arreglo,
                                  Constantes.IS_TENDENCIA: is_tendencia,
                                  Constantes.FECHA: fecha,
                                  Constantes.IMAGENES_ARREGLO: imagenes_arreglo,
                                  Constantes.CANTIDAD_FLOR: inventario]
        tablaArreglosFlores.child(id_arreglo_flor).updateChildValues(data)
    }
    
    func updateInventario(id_arreglo_flor: String, inventario: String){
        let data: [String:Any] = [Constantes.CANTIDAD_FLOR: inventario]
        tablaArreglosFlores.child(id_arreglo_flor).updateChildValues(data)
    }
    
    func updatePromocion(id_arreglo_flor: String, descuento_product: String, descuento_envio_rapido: String, descuento_envio_super: String, fecha: String){
        let data: [String:Any] = [Constantes.DESCUENTO_PRODUCTO: descuento_product,
                                  Constantes.PRECIO_DESCUENTO_ENVIO_RAPIDO: descuento_envio_rapido,
                                  Constantes.PRECIO_DESCUENTO_ENVIO_SUPER: descuento_envio_super,
                                  Constantes.FECHA: fecha]
        tablaArreglosFlores.child(id_arreglo_flor).updateChildValues(data)
    }
    
    func updateTendencia(id_arreglo: String, is_tendencia: Bool){
        let data: [String:Any] = [Constantes.IS_TENDENCIA: is_tendencia]
        tablaArreglosFlores.child(id_arreglo).updateChildValues(data)
    }
    
    func floresInArreglo(id_arreglo: String, id_flor: String, name_flor: String, cantidad_flor: String){
        let data: [String:Any] = [Constantes.ID_ARREGLO_FLOR: id_arreglo,
                                  Constantes.ID_FLOR: id_flor,
                                  Constantes.NAME_FLOR: name_flor,
                                  Constantes.CANTIDAD_FLOR: cantidad_flor]
        tablaArreglosFlores.child(id_arreglo).child(Constantes.FLORES_ARREGLO).child(id_flor).updateChildValues(data)
    }
    
    func updateDirecciones(id_user: String, id_direccion: String, direccion: String, latitud: Double, longitud: Double, noInterior: String, noExterior: String, referencias: String, calle: String){
        let data: [String:Any] = [Constantes.ID_USER: id_user,
                                  Constantes.ID_DIRECCION: id_direccion,
                                  Constantes.DIRECCION: direccion,
                                  Constantes.LATITUDE: latitud,
                                  Constantes.LONGITUD: longitud,
                                  Constantes.NO_INTERIOR: noInterior,
                                  Constantes.NO_EXTERIOR: noExterior,
                                  Constantes.CALLE: calle,
                                  Constantes.REFERENCIAS: referencias]
        tablaDirecciones.child(id_direccion).updateChildValues(data)
    }
    
    func updatePedidos(id_pedido: String, id_user: String, id_repartidor: String, fecha: String, fechaHora: String, name_flores: String, total: String, id_direccion: String, tiempo_entrega: String, tiempo_elaboracion: String, metodo: String, envio: String, tipo_envio: String, isRegalo: Bool, name_destinatario: String,proceso: String, latitud: Double, longitud: Double, id_tarjeta: String){
        let data: [String:Any] = [Constantes.ID_PEDIDO: id_pedido,
                                  Constantes.ID_USER: id_user,
                                  Constantes.ID_REPARTIDOR: id_repartidor,
                                  Constantes.FECHA: fecha,
                                  Constantes.FECHA_SIN_HORA: fechaHora,
                                  Constantes.NOMBRE_FLORES: name_flores,
                                  Constantes.TOTAL: total,
                                  Constantes.ID_DIRECCION: id_direccion,
                                  Constantes.TIEMPO_ENTREGA: tiempo_entrega,
                                  Constantes.TIEMPO_ELABORACION: tiempo_elaboracion,
                                  Constantes.METODO_PAGO: metodo,
                                  Constantes.TIPO_ENVIO: tipo_envio,
                                  Constantes.COSTO_ENVIO: envio,
                                  Constantes.ISREGALO: isRegalo,
                                  Constantes.NAME_DESTINATARIO: name_destinatario,
                                  Constantes.PROCESO: proceso,
                                  Constantes.LATITUD_REPARTIDOR: latitud,
                                  Constantes.LONGITUD_REPARTIDOR: longitud,
                                  Constantes.ID_TARJETA: id_tarjeta]
        tablaPedidos.child(id_pedido).updateChildValues(data)
    }
    
    func updateLatitud(id_pedido: String, latitud: Double, longitud: Double){
        let data: [String:Any] = [Constantes.LATITUD_REPARTIDOR: latitud,
                                  Constantes.LONGITUD_REPARTIDOR: longitud]
        tablaPedidos.child(id_pedido).updateChildValues(data)
    }
    
    func updateRepartidor(id_pedido: String, id_repartidor: String){
        let data: [String:Any] = [Constantes.ID_REPARTIDOR: id_repartidor]
        tablaPedidos.child(id_pedido).updateChildValues(data)
    }
    
    func updateProceso(id_pedido: String, proceso: String){
        let data: [String:Any] = [Constantes.PROCESO: proceso]
        tablaPedidos.child(id_pedido).updateChildValues(data)
    }
    
    func updateFloresInPedidos(id_pedido: String, id_arreglo: String, name_flor: String, precio_flor: String, cantidad: String){
        let data: [String:Any] = [Constantes.ID_PEDIDO: id_pedido,
                                  Constantes.ID_ARREGLO_FLOR: id_arreglo,
                                  Constantes.NAME_ARREGLO_FLOR: name_flor,
                                  Constantes.PRECIO_FLOR: precio_flor,
                                  Constantes.CANTIDAD_FLOR: cantidad]
        tablaPedidos.child(id_pedido).child(Constantes.PRODUCTOS).child(id_arreglo).updateChildValues(data)
    }
    
    func updateFacturas(id_user: String, nombre_fiscal: String, rfc: String, numeroExt: String, numeroInt: String, cp: String, colonia: String, estado: String, alcaldia: String, correo_electronico: String, fecha_pedido: String, id_pedido: String){
        let data: [String:Any] = [Constantes.ID_USER: id_user,
                                  Constantes.NOMBRE_FISCAL: nombre_fiscal,
                                  Constantes.RFC: rfc,
                                  Constantes.NUMERO_EXTERIOR: numeroExt,
                                  Constantes.NUMERO_INTERIOR: numeroInt,
                                  Constantes.CP: cp,
                                  Constantes.COLONIA: colonia,
                                  Constantes.ESTADO: estado,
                                  Constantes.ALCALDIA: alcaldia,
                                  Constantes.CORREO_ELECTRONICO: correo_electronico,
                                  Constantes.FECHA_PEDIDO: fecha_pedido,
                                  Constantes.ID_PEDIDO: id_pedido]
        tablaFactura.child(id_pedido).updateChildValues(data)
    }
    
    func updateFavoritos(id_user: String, id_arreglo: String, idfav: String){
        let data: [String:Any] = [Constantes.ID_USER: id_user,
                                  Constantes.ID_ARREGLO_FLOR: id_arreglo,
                                  Constantes.ID_FAV: idfav]
        tablaFavoritos.child(idfav).updateChildValues(data)
    }
    
    func updateValoraciones(id_user: String, title_valoracion: String, descripcion: String, stars: String, fecha: String){
        let data: [String:Any] = [Constantes.ID_USER: id_user,
                                  Constantes.TITLE_VALORACION: title_valoracion,
                                  Constantes.DESCRIPCION_VALORACION: descripcion,
                                  Constantes.STARS: stars,
                                  Constantes.FECHA: fecha]
        tablaValoraciones.childByAutoId().updateChildValues(data)
    }
    
    func updateTop10(id_arreglo: String, noVendidas: String, name_flor: String, image_flor: String){
        let data: [String:Any] = [Constantes.ID_ARREGLO_FLOR: id_arreglo,
                                  Constantes.NO_VENDIDAS: noVendidas,
                                  Constantes.NAME_FLOR: name_flor,
                                  Constantes.PHOTO: image_flor]
        tablaTopDiez.child(id_arreglo).updateChildValues(data)
    }
    
    func updateGananciasMensuales(mes: String, id_arreglo: String, name: String, precio: String, no_Vendidos: String, total_vendidos: String){
        let data: [String:Any] = [Constantes.MES: mes,
                                  Constantes.ID_ARREGLO_FLOR: id_arreglo,
                                  Constantes.NAME_ARREGLO_FLOR: name,
                                  Constantes.PRECIO_FLOR: precio,
                                  Constantes.NO_VENDIDOS: no_Vendidos,
                                  Constantes.TOTAL_VENDIDOS: total_vendidos]
        tablaGananciasMensuales.child(mes).child(id_arreglo).updateChildValues(data)
    }
    
    func updateGananciasAnuales(id_arreglo: String, name: String, precio: String, no_Vendidos: String, total_vendidos: String){
        let data: [String:Any] = [Constantes.ID_ARREGLO_FLOR: id_arreglo,
                                  Constantes.NAME_ARREGLO_FLOR: name,
                                  Constantes.PRECIO_FLOR: precio,
                                  Constantes.NO_VENDIDOS: no_Vendidos,
                                  Constantes.TOTAL_VENDIDOS: total_vendidos]
        tablaGananciasTotales.child(id_arreglo).updateChildValues(data)
    }*/
    
}
