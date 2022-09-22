// To parse this JSON data, do
//
//     final productosResponse = productosResponseFromMap(jsonString);

import 'dart:convert';

import '../busqueda.dart';


class ProductoBusqueda {
    ProductoBusqueda({
        required this.total,
        required this.productos,
    });

    String total;
    List<Productobus> productos;

    factory ProductoBusqueda.fromJson(String str) => ProductoBusqueda.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductoBusqueda.fromMap(Map<String, dynamic> json) => ProductoBusqueda(
        total: json["total"],
        productos: List<Productobus>.from(json["productos"].map((x) => Productobus.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "productos": List<dynamic>.from(productos.map((x) => x.toMap())),
    };
}
