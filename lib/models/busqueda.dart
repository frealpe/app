import 'dart:convert';

class Productobus {
    Productobus({
        this.id,
        this.nombre,
        this.genero,
        this.cantidad,
        this.usuario,
        this.precio,
        this.color,
        this.categoria,
        this.descripcion,
        this.disponible,
        this.img,

    });

    String? id;
    String? nombre;
    String? genero;
    String? cantidad;
    String? usuario;
    String? precio;
    String? color;    
    String? categoria;
    String? descripcion;
    String? disponible;
    String? img;


    factory Productobus.fromJson(String str) => Productobus.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

     factory Productobus.fromMap(Map<String, dynamic> json) {

          return Productobus(
              id: json["_id"],
              nombre: json["nombre"],
              genero: json["genero"],
              cantidad: json["cantidad"],
              usuario: json["usuario"],
              precio: json["precio"],
              color: json["color"],              
              categoria: json["categoria"],
              descripcion: json["descripcion"],
              disponible: json["disponible"], 
              img: json["img"],
          ); 
           
     } 
     
      Map<String, dynamic> toMap() => {
        
        "_id": id,
        "nombre": nombre,
        "genero": genero,
        "cantidad": cantidad,
        "usuario": usuario,
        "precio": precio,
        "color": color,
        "categoria": categoria,
        "descripcion": descripcion,
        "disponible": disponible,
        "img": img,
    };

}

