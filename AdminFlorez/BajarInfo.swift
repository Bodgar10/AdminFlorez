//
//  BajarInfo.swift
//  Florez
//
//  Created by bodgar jair espinosa miranda on 19/11/18.
//  Copyright © 2018 bodgar jair espinosa miranda. All rights reserved.
//

import Foundation
import CoreData
import CoreLocation
/*import FirebaseAuth
import FirebaseStorage
import Firebase
import FirebaseDatabase
import CoreData
import CoreLocation*/

class BajarInfo {
    
    private static let _instance = BajarInfo()
    
    static var Instance: BajarInfo {
        return _instance
    }
    
    /*func guardarImagenes(post: String, image: UIImage, name: String, completion: @escaping (String) -> Void){
        let storage = Storage.storage().reference(forURL: "gs://floreria-2b368.appspot.com")
        let Poststorage = storage.child(post)
        let imageRef = Poststorage.child("\(name).jpg")
        let data = UIImageJPEGRepresentation(image, 0.6)
        let uploadTask = imageRef.putData(data!, metadata: nil) { (metadata, error) in
            if error != nil {
                //self.endActivityIndicator()
                completion(Constantes.MESSAGE_FAIL)
                //self.alert(title: "Hubo un error", message: "Inténtalo más tarde.")
            }else {
                //self.endActivityIndicator()
                imageRef.downloadURL(completion: { (url, error) in
                    if error != nil {
                        completion("\(error!.localizedDescription)")
                        print(error?.localizedDescription ?? "")
                    }else {
                        completion(url!.absoluteString)
                    }
                })
            }
        }
        uploadTask.resume()
    }
    
    func login(email: String, pass: String, completion: @escaping (String) -> Void) {
        print("INGRESAR: ENTRAMOS AQUI")
        Auth.auth().signIn(withEmail: email, password: pass, completion: { (user, error) in
            //self.endActivityIndicator()
            print("INGRESAR: LUEGO AQUI MERO")
            if error != nil {
                completion(error!.localizedDescription)
            }else {
                completion(Constantes.MESSAGE_OK)
                //QUE TIPO ES
            }
        })
        //return "Ok"
    }
    
    func register(tipo: String, telefono: String, nombre: String,
                  correo: String, contrasena: String, id_metodo: String, isDisponible: String,
                  foto: String, identificacion: String, licencia: String, tipo_navegacion: String,
                  id_user: String, token: String, completion: @escaping (String) -> Void) {
        
        print("ENTRAMOS AQUI con: \(correo)")
        
        Auth.auth().createUser(withEmail: correo, password: contrasena, completion: { (user, error) in
            
            if let firebaseError = error {
                completion(firebaseError.localizedDescription)
            }else if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest(){
                print("LUEGO AQUI")
                changeRequest.displayName = nombre
                changeRequest.commitChanges(completion: nil)
                
                SubirInfo.Instance.crearUsuario(tipo: tipo, telefono: telefono, nombre: nombre, correo: correo, contrasena: contrasena, id_metodo: id_metodo, foto: foto, identificacion: identificacion, licencia: licencia, tipo_navegacion: tipo_navegacion, id_user: id_user, token: token, status: isDisponible, codigo: BajarInfo.Instance.randomString(length: 6))
                completion(Constantes.MESSAGE_OK)
                
            }
        })
    }
    
    func changeEmail(id: String, email: String, completion: @escaping (String) -> Void){
        let user = Auth.auth().currentUser
        user!.updateEmail(to: email) { (error) in
            if error != nil {
                completion(error!.localizedDescription)
            }else{
                SubirInfo.Instance.changeCorreo(correo: email, id_user: id)
                completion(Constantes.MESSAGE_OK)
            }
        }
    }
    
    func changePass(id: String, pass: String, completion: @escaping (String) -> Void){
        let user = Auth.auth().currentUser
        user?.updatePassword(to: pass, completion: { (error) in
            
            UIApplication.shared.endIgnoringInteractionEvents()
            if error != nil {
                completion(Constantes.MESSAGE_FAIL)
            } else {
                SubirInfo.Instance.changePass(pass: pass, id_user: id)
                completion(Constantes.MESSAGE_OK)
            }
        })
    }
    
    func bajarUsuarios(completion: @escaping (Usuarios) -> Void){
        SubirInfo.Instance.tablaUsuario.observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let type = data[Constantes.TYPE] as? String,
                    let phone = data[Constantes.PHONE] as? String {
                    if let name = data[Constantes.NAME] as? String,
                        let correo = data[Constantes.EMAIL] as? String {
                        if let token = data[Constantes.TOKEN] as? String,
                            let photo = data[Constantes.PHOTO] as? String {
                            if let pass = data[Constantes.PASSWORD] as? String,
                                let id_metodo = data[Constantes.ID_METODO] as? String{
                                if let disponible = data[Constantes.STATUS] as? String,
                                    let identificacion = data[Constantes.IDENTIFICACION] as? String {
                                    if let licencia = data[Constantes.LICENCIA] as? String,
                                        let tipo_navegacion = data[Constantes.TIPO_NAVEGACION] as? String,
                                        let id_user = data[Constantes.ID_USER] as? String,
                                        let codigo = data[Constantes.CODIGO] as? String {
                                        completion(Usuarios(tipo: type, phone: phone, name: name, email: correo, token: token, photo: photo, pass: pass, id_metodo: id_metodo, identificacion: identificacion, licencia: licencia, tipo_navegacion: tipo_navegacion, id_user: id_user, status: disponible, codigo: codigo))
                                    }else{
                                        print("USUARIO 7")
                                    }
                                }else{
                                    print("USUARIO 6")
                                }
                            }else{
                                print("USUARIO 5")
                            }
                        }else{
                            print("USUARIO 4")
                        }
                    }else{
                        print("USUARIO 3")
                    }
                }else{
                    print("USUARIO 2")
                }
            }else{
                print("USUARIO 1")
            }
        }
    }
    
    func bajarFlorDia(completion: @escaping (FlorDia) -> Void){
        SubirInfo.Instance.tablaFlorDia.observe(.value) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let name = data[Constantes.NAME_FLOR_DIA] as? String,
                    let descripcion = data[Constantes.DESCRIPCION_FLOR_DIA] as? String,
                    let id_categoria = data[Constantes.ID_CATEGORIA] as? String,
                    let imagen = data[Constantes.PHOTO] as? String {
                    completion(FlorDia(name_flor_dia: name, descripcion_flor_dia: descripcion, id_Categoria: id_categoria, imagen: imagen))
                }else{
                    print("FLOR DIA 2")
                }
            }else{
                print("FLOR DIA 1")
            }
        }
    }
    
    func bajarImagenTendencia(completion: @escaping (String) -> Void){
        SubirInfo.Instance.tablaTendencias.observe(.value) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let imagen = data[Constantes.PHOTO] as? String{
                    completion(imagen)
                }else{
                    print("IMAGEN TENDENCIA 2")
                }
            }else{
                print("IMAGEN TENDENCIA  1")
            }
        }
    }
    
    func bajarCategorias(completion: @escaping (Categorias) -> Void){
        SubirInfo.Instance.tablaCategorias.observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let name = data[Constantes.CATEGORIA] as? String,
                    let id_categoria = data[Constantes.ID_CATEGORIA] as? String {
                    if let imagen_Categoria = data[Constantes.IMAGEN_CATEGORIA] as? String,
                        let is_flor = data[Constantes.IS_FLOR_DIA] as? Bool {
                        completion(Categorias(name_categoria: name, id_Categoria: id_categoria, imagen_categoria: imagen_Categoria, is_flor: is_flor, isSelected: false))
                    }else{
                        print("CATEGORIAS 3")
                    }
                }else{
                    print("CATEGORIAS 2")
                }
            }else{
                print("CATEGORIAS 1")
            }
        }
    }
    
    func bajarFlores(completion: @escaping (Flores) -> Void){
        SubirInfo.Instance.tablaFlores.observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let name = data[Constantes.NAME_FLOR] as? String,
                    let cantidad = data[Constantes.CANTIDAD_FLOR] as? String,
                    let id_flor = data[Constantes.ID_FLOR] as? String{
                    completion(Flores(name_flor: name, id_flor: id_flor, cantidad: cantidad, is_selected: false))
                }else{
                    print("FLORES 2")
                }
            }else{
                print("FLORES 1")
            }
        }
    }
    
    func bajarToken(completion: @escaping (Tokens) -> Void){
        SubirInfo.Instance.tablaTokens.observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let token = data[Constantes.TOKEN] as? String,
                    let id_usuario = data[Constantes.ID_USER] as? String{
                    print("TOKENS 3: \(token)")
                    completion(Tokens(token: token, id: id_usuario))
                }else{
                    print("TOKENS 2")
                }
            }else{
                print("TOKENS 1")
            }
        }
    }
    
    func bajarCosto(completion: @escaping (String) -> Void){
        SubirInfo.Instance.tablaCostoEnvi.observe(.value) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let costo = data[Constantes.COSTO_ENVIO] as? String{
                    print("COSTOS 3: \(costo)")
                    completion(costo)
                }else{
                    print("COSTOS 2")
                }
            }else{
                print("COSTOS 1")
            }
        }
    }
    
    func bajarArreglosFlorales(completion: @escaping (ArreglosFlorales) -> Void){
        SubirInfo.Instance.tablaArreglosFlores.queryOrdered(byChild: Constantes.TIEMPO_ELABORACION).observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let id_Categoria = data[Constantes.ID_CATEGORIA] as? [String] {
                        if let id_arreglo = data[Constantes.ID_ARREGLO_FLOR] as? String,
                            let name_arreglo = data[Constantes.NAME_ARREGLO_FLOR] as? String,
                            let precio = data[Constantes.PRECIO_FLOR] as? String,
                            let tiempo_elaboracion = data[Constantes.TIEMPO_ELABORACION] as? String {
                            if let isExistencia = data[Constantes.ISEXISTENCIA] as? Bool,
                                let descripcion = data[Constantes.DESCRIPCION_FLOR] as? String,
                                let descuento_producto = data[Constantes.DESCUENTO_PRODUCTO] as? String {
                                if let precio_envio_rapido = data[Constantes.PRECIO_DESCUENTO_ENVIO_RAPIDO] as? String,
                                    let precio_envio_super = data[Constantes.PRECIO_DESCUENTO_ENVIO_SUPER] as? String,
                                    let is_tendencia = data[Constantes.IS_TENDENCIA] as? Bool,
                                    let imagen = data[Constantes.PHOTO] as? String ,
                                    let imagenes = data[Constantes.IMAGENES_ARREGLO] as? NSArray,
                                    let fecha = data[Constantes.FECHA] as? String,
                                    let inventario = data[Constantes.CANTIDAD_FLOR] as? String{
                                    completion(ArreglosFlorales(id_categoria: id_Categoria,
                                                                id_arreglo: id_arreglo,
                                                                name_arreglo: name_arreglo,
                                                                precio_arreglo: precio,
                                                                tiempo_elaboracion: tiempo_elaboracion,
                                                                isExistencia: isExistencia,
                                                                descripcion: descripcion,
                                                                descuento_producto: descuento_producto,
                                                                descuento_envio_rapido: precio_envio_rapido,
                                                                descuento_envio_super: precio_envio_super,
                                                                is_tendencia: is_tendencia,
                                                                imagen: imagen,
                                                                cantidad: "0",
                                                                imagenes: imagenes as! [String],
                                                                fecha: fecha,
                                                                isSelected: false,
                                                                inventario: inventario))
                                }else{
                                    print("ARREGLOS 5")
                                }
                            }else{
                                print("ARREGLOS 4")
                            }
                        }else{
                            print("ARREGLOS 3")
                        }
                }else{
                    print("ARREGLOS 2")
                }
            }else{
                print("ARREGLOS 1")
            }
        }
    }
    
    //.queryOrdered(byChild: Constantes.TIEMPO_ELABORACION)
    
    func bajarTodosArreglosFlorales(completion: @escaping (ArreglosFlorales) -> Void){
        SubirInfo.Instance.tablaArreglosFlores.queryOrdered(byChild: Constantes.TIEMPO_ELABORACION).observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let id_Categoria = data[Constantes.ID_CATEGORIA] as? [String] {
                    if let id_arreglo = data[Constantes.ID_ARREGLO_FLOR] as? String,
                        let name_arreglo = data[Constantes.NAME_ARREGLO_FLOR] as? String,
                        let precio = data[Constantes.PRECIO_FLOR] as? String,
                        let tiempo_elaboracion = data[Constantes.TIEMPO_ELABORACION] as? String {
                        if let isExistencia = data[Constantes.ISEXISTENCIA] as? Bool,
                            let descripcion = data[Constantes.DESCRIPCION_FLOR] as? String,
                            let descuento_producto = data[Constantes.DESCUENTO_PRODUCTO] as? String {
                            if let precio_envio_rapido = data[Constantes.PRECIO_DESCUENTO_ENVIO_RAPIDO] as? String,
                                let precio_envio_super = data[Constantes.PRECIO_DESCUENTO_ENVIO_SUPER] as? String,
                                let is_tendencia = data[Constantes.IS_TENDENCIA] as? Bool,
                                let imagen = data[Constantes.PHOTO] as? String,
                                let imagenes = data[Constantes.IMAGENES_ARREGLO] as? NSArray,
                                let fecha = data[Constantes.FECHA] as? String,
                                let inventario = data[Constantes.CANTIDAD_FLOR] as? String {
                                completion(ArreglosFlorales(id_categoria: id_Categoria,
                                                            id_arreglo: id_arreglo,
                                                            name_arreglo: name_arreglo,
                                                            precio_arreglo: precio,
                                                            tiempo_elaboracion: tiempo_elaboracion,
                                                            isExistencia: isExistencia,
                                                            descripcion: descripcion,
                                                            descuento_producto: descuento_producto,
                                                            descuento_envio_rapido: precio_envio_rapido,
                                                            descuento_envio_super: precio_envio_super,
                                                            is_tendencia: is_tendencia,
                                                            imagen: imagen, cantidad: "0",
                                                            imagenes: imagenes as! [String],
                                                            fecha: fecha,
                                                            isSelected: false,
                                                            inventario: inventario))
                            }else{
                                print("ARREGLOS 5")
                            }
                        }else{
                            print("ARREGLOS 4")
                        }
                    }else{
                        print("ARREGLOS 3")
                    }
                }else{
                    print("ARREGLOS 2")
                }
            }else{
                print("ARREGLOS 1")
            }
        }
    }
    
    
    func bajarFloresInArreglosFlorales(id_arreglo: String, completion: @escaping (FloresInArreglo) -> Void){
        SubirInfo.Instance.tablaArreglosFlores.child(id_arreglo).child(Constantes.FLORES_ARREGLO).observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let id_arreglo = data[Constantes.ID_ARREGLO_FLOR] as? String {
                    if let id_flor = data[Constantes.ID_FLOR] as? String,
                        let name_flor = data[Constantes.NAME_FLOR] as? String,
                        let cantidad = data[Constantes.CANTIDAD_FLOR] as? String {
                        completion(FloresInArreglo(id_arreglo: id_arreglo, id_flor: id_flor, name_flor: name_flor, cantidad_flor: cantidad))
                    }else{
                        print("FLORES IN ARREGLOS 3")
                    }
                }else{
                    print("FLORES IN ARREGLOS 2")
                }
            }else{
                print("FLORES IN ARREGLOS 1")
            }
        }
    }
    
    func bajarTarjetas(id: String ,completion: @escaping (Tarjetas) -> Void){
        SubirInfo.Instance.tablaTarjetas.child(id).observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? NSDictionary {
                if let id_user = data[Constantes.ID_USER] as? String,
                    let id_tarjeta = data[Constantes.ID_TARJETA] as? String {
                    if let terminacion = data[Constantes.TERMINACION] as? String {
                        completion(Tarjetas(id_tarjeta: id_tarjeta, id_user: id_user, terminacion: terminacion))
                    }else{
                        print("TARJETAS 4")
                    }
                }else{
                    print("TARJETAS 3")
                }
            }
        }
    }
    
    func bajarDirecciones(completion: @escaping (Direcciones) -> Void){
        SubirInfo.Instance.tablaDirecciones.observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? NSDictionary {
                if let id_user = data[Constantes.ID_USER] as? String,
                    let id_direccion = data[Constantes.ID_DIRECCION] as? String {
                    if let direccion = data[Constantes.DIRECCION] as? String,
                        let latitude = data[Constantes.LATITUDE] as? Double,
                        let longitude = data[Constantes.LONGITUD] as? Double {
                        if let noExt = data[Constantes.NO_EXTERIOR] as? String,
                            let noInt = data[Constantes.NO_INTERIOR] as? String,
                            let referencias = data[Constantes.REFERENCIAS] as? String,
                            let calle = data[Constantes.CALLE] as? String {
                            completion(Direcciones(id_user: id_user, id_direccion: id_direccion, direccion: direccion, latitude: latitude, longitude: longitude, noInterior: noInt, noExterior: noExt, referencias: referencias, calle: calle))
                        }else{
                            print("DIRECCIONES 4")
                        }
                    }else{
                        print("DIRECCIONES 3")
                    }
                }else{
                    print("DIRECCIONES 2")
                }
            }else{
                print("DIRECCIONES 1")
            }
        }
    }
    
    func bajarPedidosChange(completion: @escaping (Pedidos) -> Void){
        SubirInfo.Instance.tablaPedidos.observe(.childChanged) { (snapshot) in
            if let data = snapshot.value as? NSDictionary {
                if let id_pedido = data[Constantes.ID_PEDIDO] as? String,
                    let id_user = data[Constantes.ID_USER] as? String,
                    let id_repartidor = data[Constantes.ID_REPARTIDOR] as? String,
                    let id_direccion = data[Constantes.ID_DIRECCION] as? String {
                    if let fecha = data[Constantes.FECHA] as? String,
                        let fecha_hora = data[Constantes.FECHA_SIN_HORA] as? String,
                        let nombre_flores = data[Constantes.NOMBRE_FLORES] as? String {
                        if let total = data[Constantes.TOTAL] as? String,
                            let tiempo_entrega = data[Constantes.TIEMPO_ENTREGA] as? String,
                            let tiempo_elaboracion = data[Constantes.TIEMPO_ELABORACION] as? String {
                            if let metodo = data[Constantes.METODO_PAGO] as? String,
                                let tipo_envio = data[Constantes.TIPO_ENVIO] as? String,
                                let costo_envio = data[Constantes.COSTO_ENVIO] as? String {
                                if let regalo = data[Constantes.ISREGALO] as? Bool,
                                    let name_Destinatario = data[Constantes.NAME_DESTINATARIO] as? String,
                                    let proceso = data[Constantes.PROCESO] as? String,
                                    let latitud = data[Constantes.LATITUD_REPARTIDOR] as? Double,
                                    let longitud = data[Constantes.LONGITUD_REPARTIDOR] as? Double,
                                    let id_tarjeta = data[Constantes.ID_TARJETA] as? String{
                                    completion(Pedidos(id_pedido: id_pedido, id_user: id_user, id_repartidor: id_repartidor, fecha: fecha, fecha_sin_hora: fecha_hora, nombre_flores: nombre_flores, total: total, id_direccion: id_direccion, tiempo_entrega: tiempo_entrega, tiempo_elaboracion: tiempo_elaboracion, metodo_pago: metodo, tipo_envio: tipo_envio, costo_envio: costo_envio, isRegalo: regalo, name_destinatario: name_Destinatario, proceso: proceso, latitud: latitud, longitud: longitud, id_tarjeta: id_tarjeta))
                                }else{
                                    print("PEDIDOS 6")
                                }
                            }else{
                                print("PEDIDOS 5")
                            }
                        }else{
                            print("PEDIDOS 4")
                        }
                    }else{
                        print("PEDIDOS 3")
                    }
                }else{
                    print("PEDIDOS 2")
                }
            }else{
                print("PEDIDOS 1")
            }
        }
    }
    
    func bajarPedidos(completion: @escaping (Pedidos) -> Void){
        SubirInfo.Instance.tablaPedidos.observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? NSDictionary {
                if let id_pedido = data[Constantes.ID_PEDIDO] as? String,
                    let id_user = data[Constantes.ID_USER] as? String,
                    let id_repartidor = data[Constantes.ID_REPARTIDOR] as? String,
                    let id_direccion = data[Constantes.ID_DIRECCION] as? String {
                    if let fecha = data[Constantes.FECHA] as? String,
                        let fecha_hora = data[Constantes.FECHA_SIN_HORA] as? String,
                        let nombre_flores = data[Constantes.NOMBRE_FLORES] as? String {
                        if let total = data[Constantes.TOTAL] as? String,
                            let tiempo_entrega = data[Constantes.TIEMPO_ENTREGA] as? String,
                            let tiempo_elaboracion = data[Constantes.TIEMPO_ELABORACION] as? String {
                            if let metodo = data[Constantes.METODO_PAGO] as? String,
                                let tipo_envio = data[Constantes.TIPO_ENVIO] as? String,
                                let costo_envio = data[Constantes.COSTO_ENVIO] as? String {
                                if let regalo = data[Constantes.ISREGALO] as? Bool,
                                    let name_Destinatario = data[Constantes.NAME_DESTINATARIO] as? String,
                                    let proceso = data[Constantes.PROCESO] as? String,
                                    let latitud = data[Constantes.LATITUD_REPARTIDOR] as? Double,
                                    let longitud = data[Constantes.LONGITUD_REPARTIDOR] as? Double, let id_tarjeta = data[Constantes.ID_TARJETA] as? String{
                                    completion(Pedidos(id_pedido: id_pedido, id_user: id_user, id_repartidor: id_repartidor, fecha: fecha, fecha_sin_hora: fecha_hora, nombre_flores: nombre_flores, total: total, id_direccion: id_direccion, tiempo_entrega: tiempo_entrega, tiempo_elaboracion: tiempo_elaboracion, metodo_pago: metodo, tipo_envio: tipo_envio, costo_envio: costo_envio, isRegalo: regalo, name_destinatario: name_Destinatario, proceso: proceso, latitud: latitud, longitud: longitud, id_tarjeta: id_tarjeta))
                                }else{
                                    print("PEDIDOS 6")
                                }
                            }else{
                                print("PEDIDOS 5")
                            }
                        }else{
                            print("PEDIDOS 4")
                        }
                    }else{
                        print("PEDIDOS 3")
                    }
                }else{
                    print("PEDIDOS 2")
                }
            }else{
                print("PEDIDOS 1")
            }
        }
    }
    
    func bajarFloresInPedido(id_pedido: String, completion: @escaping (FloresInPedido) -> Void){
        SubirInfo.Instance.tablaPedidos.child(id_pedido).child(Constantes.PRODUCTOS).observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? NSDictionary {
                if let id_pedido = data[Constantes.ID_PEDIDO] as? String,
                    let id_arreglo = data[Constantes.ID_ARREGLO_FLOR] as? String,
                    let name_arreglo = data[Constantes.NAME_ARREGLO_FLOR] as? String {
                    if let precio = data[Constantes.PRECIO_FLOR] as? String,
                        let cantidad = data[Constantes.CANTIDAD_FLOR] as? String {
                        completion(FloresInPedido(id_pedido: id_pedido, id_arreglo: id_arreglo, name_arreglo: name_arreglo, precio_flor: precio, cantidad: cantidad))
                    }else{
                        print("FLORES PEDIDO 3")
                    }
                }else{
                    print("FLORES PEDIDO 2")
                }
            }else{
                print("FLORES PEDIDO 1")
            }
        }
    }
    
    
    func bajarFacturas(id_pedido: String, completion: @escaping (Facturas) -> Void){
        SubirInfo.Instance.tablaFactura.child(id_pedido).observe(.value) { (snapshot) in
            if let data = snapshot.value as? NSDictionary {
                if let nombre_fiscal = data[Constantes.NOMBRE_FISCAL] as? String,
                    let rfc = data[Constantes.RFC] as? String,
                    let numInt = data[Constantes.NUMERO_INTERIOR] as? String {
                    if let numExt = data[Constantes.NUMERO_EXTERIOR] as? String,
                        let cp = data[Constantes.CP] as? String, let colonia = data[Constantes.COLONIA] as? String {
                        if let estado = data[Constantes.ESTADO] as? String,
                            let alcaldia = data[Constantes.ALCALDIA] as? String,
                            let correo = data[Constantes.CORREO_ELECTRONICO] as? String,
                            let fecha = data[Constantes.FECHA_PEDIDO] as? String,
                            let id_pedido = data[Constantes.ID_PEDIDO] as? String,
                            let id_user = data[Constantes.ID_USER] as? String{
                            completion(Facturas(id_user: id_user, nombre_fiscal: nombre_fiscal, rfc: rfc, numeroExt: numExt, numeroInt: numInt, cp: cp, colonia: colonia, estado: estado, alcaldia: alcaldia, correo_electronico: correo, fecha_pedido: fecha, id_pedido: id_pedido))
                        }else{
                            print("FACTURAS 4")
                        }
                    }else{
                        print("FACTURAS 3")
                    }
                }else{
                    print("FACTURAS 2")
                }
            }else{
                print("FACTURAS 1")
            }
        }
    }
    
    func bajarFavoritos(completion: @escaping (Favoritos) -> Void){
        SubirInfo.Instance.tablaFavoritos.observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let id_user = data[Constantes.ID_USER] as? String,
                    let id_arreglo = data[Constantes.ID_ARREGLO_FLOR] as? String,
                    let id_fav = data[Constantes.ID_FAV] as? String {
                    completion(Favoritos(id_user: id_user, id_arreglo: id_arreglo, id_fav: id_fav))
                }else{
                    print("FAVORITOS 2")
                }
            }else{
                print("FAVORITOS 1")
            }
        }
    }
    
    func bajarValoraciones(completion: @escaping (Valoraciones) -> Void){
        SubirInfo.Instance.tablaValoraciones.observe(.childAdded) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let id_user = data[Constantes.ID_USER] as? String,
                    let title = data[Constantes.TITLE_VALORACION] as? String {
                    if let descripcion = data[Constantes.DESCRIPCION_VALORACION] as? String,
                        let stars = data[Constantes.STARS] as? String,
                        let fecha = data[Constantes.FECHA] as? String {
                        completion(Valoraciones(id_user: id_user, title: title, descripcion: descripcion, stars: stars, fecha: fecha))
                    }else{
                        print("VALORACIONES 3")
                    }
                }else{
                    print("VALORACIONES 2")
                }
            }else{
                print("VALORACIONES 1")
            }
        }
    }
    
    func bajarTop10(completion: @escaping (TopDiez) -> Void){
        SubirInfo.Instance.tablaTopDiez.observe(.value) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let id_arreglo = data[Constantes.ID_ARREGLO_FLOR] as? String,
                    let vendidos = data[Constantes.NO_VENDIDAS] as? String,
                    let name = data[Constantes.NAME_FLOR] as? String,
                    let photo = data[Constantes.PHOTO] as? String {
                    completion(TopDiez(id_arreglo: id_arreglo, vendidos: vendidos, name_arreglo: name, image_arreglo: photo))
                }else{
                    print("TOP 10 2")
                }
            }else{
                print("TOP 10 1")
            }
        }
    }
    
    func bajarMensuales(mes: String, completion: @escaping (Ganancias) -> Void){
        SubirInfo.Instance.tablaGananciasMensuales.child(mes).observe(.value) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let mes = data[Constantes.MES] as? String,
                    let id_arreglo = data[Constantes.ID_ARREGLO_FLOR] as? String {
                    if let name_arreglo = data[Constantes.NAME_ARREGLO_FLOR] as? String,
                        let precio = data[Constantes.PRECIO_FLOR] as? String {
                        if let vendidos = data[Constantes.NO_VENDIDOS] as? String,
                            let total = data[Constantes.TOTAL_VENDIDOS] as? String {
                            completion(Ganancias(mes: mes, name_arreglo: name_arreglo, id_arreglo: id_arreglo, precio_flor: precio, vendidos: vendidos, total: total))
                        }else{
                            print("MENSUALES 4")
                        }
                    }else{
                        print("MENSUALES 3")
                    }
                }else{
                    print("MENSUALES 2")
                }
            }else{
                print("MENSUALES 1")
            }
        }
    }
    
    func bajarMensuales(completion: @escaping (Ganancias) -> Void){
        SubirInfo.Instance.tablaGananciasTotales.observe(.value) { (snapshot) in
            if let data = snapshot.value as? NSDictionary{
                if let id_arreglo = data[Constantes.ID_ARREGLO_FLOR] as? String {
                    if let name_arreglo = data[Constantes.NAME_ARREGLO_FLOR] as? String,
                        let precio = data[Constantes.PRECIO_FLOR] as? String {
                        if let vendidos = data[Constantes.NO_VENDIDOS] as? String,
                            let total = data[Constantes.TOTAL_VENDIDOS] as? String {
                            completion(Ganancias(mes: "mes", name_arreglo: name_arreglo, id_arreglo: id_arreglo, precio_flor: precio, vendidos: vendidos, total: total))
                        }else{
                            print("MENSUALES 4")
                        }
                    }else{
                        print("MENSUALES 3")
                    }
                }else{
                    print("MENSUALES 2")
                }
            }else{
                print("MENSUALES 1")
            }
        }
    }*/
    
    func comprobarRangoUser(latitud_user: Double, longitudUser: Double, latitud_prof: Double, longitud_prof: Double, limite: Double) -> String{
        
        print("///////////////////////////////////////////////////////////")
        print("///////////////////////////////////////////////////////////")
        
        print("LAT_USER: \(latitud_user), LON_USER: \(longitudUser)")
        
        print("LAT_PROF: \(latitud_prof), LON_PROF: \(longitud_prof)")
        let coordinate₀ = CLLocation(latitude: latitud_user, longitude: longitudUser)
        let coordinate₁ = CLLocation(latitude: latitud_prof, longitude: longitud_prof)
        
        let distanceInMeters = coordinate₀.distance(from: coordinate₁)
        
        let kilometros = distanceInMeters/1000
        print("METROS TOTAL: \(kilometros)")
        
        //40
        if kilometros <= limite{
            return Constantes.MESSAGE_OK
        }else{
            return Constantes.MESSAGE_FAIL
        }
    }
    
    func convertDateFormater(_ date: String) -> String
    {
        print("FECHA SOLICITADA: \(date)")
        let dateFormatter = DateFormatter()
        let language = Bundle.main.preferredLocalizations.first
        dateFormatter.locale = Locale.init(identifier: language!)
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "MMM dd,yyyy HH:mm"
        return  dateFormatter.string(from: date!)
        
    }
    
    func convertDateFormater1(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        let language = Bundle.main.preferredLocalizations.first
        dateFormatter.locale = Locale.init(identifier: language!)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "MMM dd,yyyy"
        return  dateFormatter.string(from: date!)
        
    }
    
    func saberLaSemana(fecha: String) -> Int {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        let language = Bundle.main.preferredLocalizations.first
        dateFormatter.locale = Locale.init(identifier: language!)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.date(from: fecha)
        let weekOfYear = calendar.component(.weekOfMonth, from: date!)
        print(weekOfYear)
        return weekOfYear
    }
    
    func saberElMes(fecha: String) -> Int{
        print("FECHA: \(fecha)")
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        let language = Bundle.main.preferredLocalizations.first
        dateFormatter.locale = Locale.init(identifier: language!)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.date(from: fecha)
        let weekOfYear = calendar.component(.month, from: date!)
        print(weekOfYear)
        return weekOfYear
    }
    
    func comprobarFecha(dia_hoy: Int, mes_hoy: Int, ano_hoy: Int, hora_hoy: Int, minutos_hoy: Int, dia: Int, mes: Int, ano: Int, hora: Int, minutos: Int) -> String{
        print("ENTRAMOS A LA FECHA CON: \(dia) \(mes) \(ano) \(hora) y \(dia_hoy) \(mes_hoy) \(ano_hoy) \(hora_hoy)")
        if ano < ano_hoy{
            return Constantes.ERROR_FECHA
        }else if ano == ano_hoy{
            if mes < mes_hoy{
                return Constantes.ERROR_FECHA
            }else if mes == mes_hoy{
                if dia < dia_hoy{
                    return Constantes.ERROR_FECHA
                }else if dia == dia_hoy{
                    if hora < hora_hoy{
                        return Constantes.ERROR_FECHA
                    }else if hora == hora_hoy{
                        return Constantes.ERROR_FECHA
                    }else{
                        return Constantes.BUENA_FECHA
                    }
                }else{
                    return Constantes.BUENA_FECHA
                }
            }else{
                return Constantes.BUENA_FECHA
            }
        }else{
            return Constantes.BUENA_FECHA
        }
    }
    
    func comprobarFechaHora(dia_hoy: Int, mes_hoy: Int, ano_hoy: Int, hora_hoy: Int, minutos_hoy: Int, dia: Int, mes: Int, ano: Int, hora: Int, minutos: Int) -> String{
        print("ENTRAMOS A LA FECHA CON: \(dia) \(mes) \(ano) \(hora) y \(dia_hoy) \(mes_hoy) \(ano_hoy) \(hora_hoy)")
        
        if ano < ano_hoy{
            return Constantes.ERROR_FECHA
        }else if ano == ano_hoy{
            if mes < mes_hoy{
                return Constantes.ERROR_FECHA
            }else if mes == mes_hoy{
                if dia < dia_hoy{
                    return Constantes.ERROR_FECHA
                }else if dia == dia_hoy{
                    if hora + 1 == hora_hoy{
                        return Constantes.BUENA_FECHA
                    }else if hora == hora_hoy{
                        return Constantes.BUENA_FECHA
                    }else{
                        return Constantes.ERROR_FECHA
                    }
                }else{
                    return Constantes.ERROR_FECHA
                }
            }else{
                return Constantes.ERROR_FECHA
            }
        }else{
            return Constantes.ERROR_FECHA
        }
    }
    
    /*func logOut() -> Bool {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut();
                return true;
            } catch {
                return false;
            }
        }
        return true;
    }
    
    func guardarFlores(nameFlor: String, id_flor: String, cantidad_flor: String) -> String{
        var flores: FloresCore?
        
        if let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer {
            let context = container.viewContext
            
            flores = NSEntityDescription.insertNewObject(forEntityName: "FloresCore", into: context) as? FloresCore
            
            flores?.id_flor = id_flor
            flores?.cantidad_flor = cantidad_flor
            flores?.name_flor = nameFlor
            print("SE VA GUARDANDO LA FECHA")
            
            do {
                try context.save()
                return Constantes.MESSAGE_OK
                //self.isLogIn()
            } catch {
                print("Ha habido un error al guardar el lugar en Core Data")
                return Constantes.MESSAGE_FAIL
            }
        }
        
        return Constantes.MESSAGE_OK
    }
    
    func guardarDireccion(direccion1: String, referencias: String, latitud: Double, longitud: Double, calle: String, id: String) -> String{
        var direccion: DireccionesCore?
        
        if let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer {
            let context = container.viewContext
            
            direccion = NSEntityDescription.insertNewObject(forEntityName: "Direcciones", into: context) as? DireccionesCore
            
            direccion?.direccion = direccion1
            direccion?.calle = calle
            direccion?.latitud = latitud
            direccion?.longitud = longitud
            direccion?.id = id
            print("SE VA GUARDANDO LA FECHA")
            
            do {
                try context.save()
                return Constantes.MESSAGE_OK
                //self.isLogIn()
            } catch {
                print("Ha habido un error al guardar el lugar en Core Data")
                return Constantes.MESSAGE_FAIL
            }
        }
        
        return Constantes.MESSAGE_OK
    }
    
    func guardarTarjeta(id_tarjeta: String) -> String{
        var direccion: Tarjeta?
        
        if let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer {
            let context = container.viewContext
            
            direccion = NSEntityDescription.insertNewObject(forEntityName: "Tarjeta", into: context) as? Tarjeta
            
            direccion?.id_tarjeta = id_tarjeta
            print("SE VA GUARDANDO LA FECHA")
            
            do {
                try context.save()
                return Constantes.MESSAGE_OK
                //self.isLogIn()
            } catch {
                print("Ha habido un error al guardar el lugar en Core Data")
                return Constantes.MESSAGE_FAIL
            }
        }
        
        return Constantes.MESSAGE_OK
    }*/
   
    /*func borrarTarjeta(){
        if let container_direction = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer {
            let context = container_direction.viewContext
            //let productsDelete = self.fetchResultsController.object(at: indexPath)
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Tarjeta")
            let deleteRequested = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            
            do {
                try context.execute(deleteRequested)
                try context.save()
            }catch {
                print("ERROR")
            }
        }
    }
    func borrarDirecciones(){
        if let container_direction = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer {
            let context = container_direction.viewContext
            //let productsDelete = self.fetchResultsController.object(at: indexPath)
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Direcciones")
            let deleteRequested = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            
            do {
                try context.execute(deleteRequested)
                try context.save()
            }catch {
                print("ERROR")
            }
        }
    }
    
    func borrarFlores(){
        if let container_direction = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer {
            let context = container_direction.viewContext
            //let productsDelete = self.fetchResultsController.object(at: indexPath)
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "FloresCore")
            let deleteRequested = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            
            do {
                try context.execute(deleteRequested)
                try context.save()
            }catch {
                print("ERROR")
            }
        }
    }
    
    func borrarFlor(id: String){
        
        let moc = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FloresCore")
        
        let result = try? moc.fetch(fetchRequest)
        let resultData = result as! [FloresCore]
        
        for object in resultData {
            if object.id_flor == id{
                moc.delete(object)
            }
        }
        
        do {
            try moc.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
        
        // MARK: Get Context
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func guardarCarritoCore(id: String, cantidad: String) -> String{
        var favorito: Carrito?
        
        if let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer {
            let context = container.viewContext
            
            favorito = NSEntityDescription.insertNewObject(forEntityName: "Carrito", into: context) as? Carrito
            
            favorito?.id = id
            favorito?.cantidad = cantidad
            print("SE VA GUARDANDO LA FECHA")
            
            do {
                try context.save()
                return Constantes.MESSAGE_OK
                //self.isLogIn()
            } catch {
                return Constantes.MESSAGE_FAIL
                print("Ha habido un error al guardar el lugar en Core Data")
            }
        }
        
        return Constantes.MESSAGE_OK
    }
    
    func borrarCarrito(id: String){
        
        let moc = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Carrito")
        
        let result = try? moc.fetch(fetchRequest)
        let resultData = result as! [Carrito]
        
        for object in resultData {
            if object.id == id{
                moc.delete(object)
            }
        }
        
        do {
            try moc.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
        
        // MARK: Get Context
    }
    
    func actualizarCantidad(id: String, cantidad: String){
        
        print("ENTRAMOS AQUI")
        let moc = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Carrito")
        
        let result = try? moc.fetch(fetchRequest)
        let resultData = result as! [Carrito]
        
        for object in resultData {
            if object.id == id{
                object.setValue(cantidad, forKey: "cantidad")
            }
        }
        
        do {
            try moc.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
        
        // MARK: Get Context
    }
    
    func borrarTodoCarrito(){
        if let container_direction = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer {
            let context = container_direction.viewContext
            //let productsDelete = self.fetchResultsController.object(at: indexPath)
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Carrito")
            let deleteRequested = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            
            do {
                try context.execute(deleteRequested)
                try context.save()
            }catch {
                print("ERROR")
            }
        }
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0...length-1).map{ _ in letters.randomElement()! })
    }*/
    
}








































































































