//
//  Constantes.swift
//  Florez
//
//  Created by bodgar jair espinosa miranda on 19/11/18.
//  Copyright © 2018 bodgar jair espinosa miranda. All rights reserved.
//

import Foundation
//import Hero
//import ChameleonFramework

class Constantes{
    
    //URL METODO
    static let URL = "https://conekta.idev4u.com/"
    static let CREATE_COSTUMER = "\(URL)create_costumer.php?"
    static let CREATE_ORDER = "\(URL)create_order.php?"
    
    //TABLAS BASE DE DATOS
    static let TABLA_USUARIOS = "usuarios" //-----> YA
    static let TABLA_TENDENCIAS = "tendencias" //-----> YA
    static let TABLA_FLOR_DEL_DIA = "flor_dia" //-----> YA
    static let TABLA_CATEGORIAS = "categorias" //-----> YA
    static let TABLA_FLORES = "flores" //-----> YA
    static let TABLA_DIRECCIONES = "direcciones" //-----> YA
    static let TABLA_PEDIDOS = "pedidos" //-----> YA
    static let TABLA_FACTURA = "facturas" //-----> YA
    static let TABLA_VALORACIONES = "valoraciones" //-----> YA
    static let TABLA_FAVORITOS = "tabla_favoritos" //-----> YA
    static let TABLA_TOP_10 = "top_10" //-----> YA
    static let TABLA_GANANCIAS_MENSUALES = "ganancias_mensuales" //-----> YA
    static let TABLA_GANANCIAS_TOTALES = "ganancias_totales" //-----> YA
    static let TABLA_ARREGLOS_FLORALES = "arreglos_florales"
    static let TABLA_COSTO_ENVIO = "tabla_costo_envio"
    static let TABLA_TARJETAS = "tabla_tarjetas"
    static let TABLA_TOKENS = "tabla_tokens"
    
    //TABLA TARJETAS
    static let TARJETAS = "tarjetas"
    static let ID_TARJETA = "id_tarjeta"
    static let TERMINACION = "terminacion"
    
    //COSTO ENVIO
    static let ID_COSTO_ENVIO = "id_costo_envio"
    //static let COSTO_ENVIO = "costo_envio"
    
    //TIPOS
    static let USER = "usuario"
    static let ADMIN = "admin"
    static let REPARTIDOR = "repartidor"
    
    static let WAZE = "waze"
    static let GOOGLE = "google"
    
    static let TARJETA = "tarjeta"
    static let PAYPAL = "paypal"
    
    static let ESTABLECIMIENTO = "establecimiento"
    static let ENVIO_RAPIDO = "envio_rapido"
    static let ENVIO_SUPER_RAPIDO = "envio_super_rapido"
    
    static let MESSAGE_OK = "OK"
    static let MESSAGE_FAIL = "Fail"
    
    static let PENDIENTE = "pendiente"
    static let EN_ELABORACION = "en_elaboracion"
    static let COMPLETADO = "completado"
    static let CANCELADO = "cancelado"
    static let EN_CAMINO = "en_camino"
    static let EN_PROCESO = "proceso"
    static let ENTREGADO = "entregado"
    
    static let ERROR_FECHA = "error_fecha"
    static let BUENA_FECHA = "buena_fecha"
    
    static let DISPONIBLE = "Disponible"
    static let NO_DISPONIBLE = "No_Disponible"
    static let OCUPADO = "Ocupado"
    
    //TABLA USUARIOS
    static let TYPE = "tipo"
    static let PHONE = "telefono"
    static let NAME = "nombre"
    static let EMAIL = "correo"
    static let PASSWORD = "contrasena"
    static let ID_METODO = "id_metodo"
    static let STATUS = "status"
    static let PHOTO = "foto"
    static let IDENTIFICACION = "identificacion"
    static let LICENCIA = "licencia"
    static let TIPO_NAVEGACION = "tipo_navegacion"
    static let ID_USER = "id"
    static let IS_ACTIVE = "is_active"
    static let TOKEN = "token"
    static let CODIGO = "codigo"
    
    //TABLA FLOR DEL DIA
    static let NAME_FLOR_DIA = "nombre_flor_dia"
    static let DESCRIPCION_FLOR_DIA = "descripcion_flor_dia"
    static let FLORES_DIA = "flores"
    
    //TABLA_CATEGORIAS
    static let CATEGORIA = "categoria"
    static let ID_CATEGORIA = "id_categoria"
    static let IMAGEN_CATEGORIA = "imagen_categoria"
    static let IS_FLOR_DIA = "isFlorDia"
    
    //TABLA FLORES
    static let ID_FLOR = "id_flor"
    static let NAME_FLOR = "name_flor"
    static let CANTIDAD_FLOR = "cantidad_flor"
    
    //TABLA ARREGLOS FLORALES
    //ID_CATEGORIA
    static let ID_ARREGLO_FLOR = "id_arreglo"
    static let NAME_ARREGLO_FLOR = "nombre_arreglo"
    static let PRECIO_FLOR = "precio_flor"
    static let TIEMPO_ELABORACION = "tiempo_elaboracion"
    static let ISEXISTENCIA = "isExistencia"
    static let DESCRIPCION_FLOR = "descripcion_flor"
    static let DESCUENTO_PRODUCTO = "descuento_producto"
    static let DESCUENTO_ENVIO = "descuento_envio"
    static let FECHA_DESCUENTO = "fecha_descuento"
    static let PRECIO_DESCUENTO_PRODUCTO = "precio_descuento_producto"
    static let PRECIO_DESCUENTO_ENVIO_RAPIDO = "precio_descuento_envio_rapido"
    static let PRECIO_DESCUENTO_ENVIO_SUPER = "precio_descuento_envio_super"
    static let FLORES_ARREGLO = "flores_arreglo"
    static let IS_TENDENCIA = "tendencia"
    static let IMAGENES_ARREGLO = "imagenes_arreglo"
    
    //TABLA DIRECCIONES
    //ID_USER
    static let ID_DIRECCION = "id_direccion"
    static let TIPO_DIRECCION = "tipo_direccion"
    static let DIRECCION = "direccion"
    static let LATITUDE = "latitud"
    static let LONGITUD = "longitud"
    static let NO_INTERIOR = "no_interior"
    static let NO_EXTERIOR = "no_exterior"
    static let REFERENCIAS = "referencias"
    static let CALLE = "calle"
    
    //TABLA_PEDIDOS
    static let ID_PEDIDO = "id_pedido"
    static let FECHA = "fecha"
    static let FECHA_SIN_HORA = "fecha_sin_hora"
    static let NOMBRE_FLORES = "nombre_flores"
    static let TOTAL = "total"
    static let ID_DIRECCION_SOLICITADA = "id_direccion"
    static let TIEMPO_ENTREGA = "tiempo_entrega"
    static let PRODUCTOS = "productos"
    /*ID_FLOR
     NAME_FLOR
     PRECIO_FLOR
     TIEMPO_ELABORACION*/
    static let METODO_PAGO = "metodo_pago"
    static let COSTO_ENVIO = "envio"
    static let TIPO_ENVIO = "tipo_envio"
    static let ISREGALO = "isRegalo"
    static let NAME_DESTINATARIO = "nombre_destinatario"
    static let ID_REPARTIDOR = "id_repartidor"
    static let PROCESO = "proceso"
    static let LATITUD_REPARTIDOR = "latitud_repartidor"
    static let LONGITUD_REPARTIDOR = "longitud_repartidor"
    
    //TABLA_FACTURAS
    //ID_USER
    static let NOMBRE_FISCAL = "nombre_fiscal"
    static let RFC = "rfc"
    static let NUMERO_EXTERIOR = "numero_Exterior"
    static let NUMERO_INTERIOR = "numero_interior"
    static let CP = "cp"
    static let COLONIA = "colonia"
    static let ESTADO = "estado"
    static let ALCALDIA = "alcaldia"
    static let CORREO_ELECTRONICO = "correo_electronico"
    static let FECHA_PEDIDO = "fecha_pedido"
    
    //TABLA_FAVORITOS
    //id_user
    //id_flor
    static let ID_FAV = "id_fav"
    
    //TABLA VALORACIONES
    //id_user
    static let ID_VALORACION = "id_valoracion"
    static let TITLE_VALORACION = "title_valoracion"
    static let DESCRIPCION_VALORACION = "descripcion_valoracion"
    static let STARS = "stars"
    
    //TABLA_TOP_10
    //id_flor
    static let NO_VENDIDAS = "no_vendidas"
    
    //TABLA_GANANCIAS_MENSUALES Y GANANCIAS TOTALES
    static let MES = "mes"
    //id_flor
    //name
    //precio
    static let NO_VENDIDOS = "no_vendidos"
    static let TOTAL_VENDIDOS = "total_vendidos"
    
    static let MESES = ["01","02","03","04","05","06","07","08","09","10","11","12"]
    static let ANIOS = ["19","20","21","22","23","24","25","26","27","28","29","30"]
    static let TIEMPO_ESTIMADO = ["10", "15", "20", "25", "30", "45","50","55","60","65","70","80","90","100","110","120"]
    static let PORCENTAJE = ["10%","20%","30%","40%","50%","60%","70%","80%"]
    static let cantidad =  ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
}
