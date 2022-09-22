// To parse this JSON data, do
//
//     final productosResponse = productosResponseFromMap(jsonString);

import 'dart:convert';

import '../producto.dart';

class ProductoResponse {
    ProductoResponse({
        required this.total,
        required this.productos,
    });

    int total;
    List<Producto> productos;

    factory ProductoResponse.fromJson(String str) => ProductoResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductoResponse.fromMap(Map<String, dynamic> json) => ProductoResponse(
        total: json["total"],
        productos: List<Producto>.from(json["productos"].map((x) => Producto.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "productos": List<dynamic>.from(productos.map((x) => x.toMap())),
    };
}

