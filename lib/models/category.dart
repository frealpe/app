import 'dart:convert';

class Categoria {
    Categoria({
        required this.id,
        required this.nombre,
        this.usuario,
        this.img,
    });

    String id;
    String nombre;
    String? usuario;
    String? img;

    factory Categoria.fromJson(String str) => Categoria.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Categoria.fromMap(Map<String, dynamic> json) => Categoria(
        id: json["_id"],
        nombre: json["nombre"],
        usuario: json["usuario"],
        img: json["img"],

       );


    Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
        "usuario": usuario,
        "img": img,
    };

/*   @override
  String toString() {
    return 'Categoria: ${this.nombre }, id:${this.id}';
  } */
}
