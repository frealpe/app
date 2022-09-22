import 'dart:convert';

class Usuario {
    Usuario({
        required this.nombre,
        required this.correo,
        required this.estado,
        required this.google,
        required this.uid,
        required this.rol,
        this.img
    });

    String nombre;
    String correo;
    bool estado;
    bool google;
    String rol;
    String uid;
    String? img;

    factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        nombre: json["nombre"],
        correo: json["correo"],
        estado: json["estado"],
        google: json["google"],
        rol: json["rol"],
        uid: json["uid"],
        img: json["img"],

    );

    Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "correo": correo,
        "estado": estado,
        "google": google,
        "rol" : rol,
        "uid": uid,
        "img": img,
    };
}
