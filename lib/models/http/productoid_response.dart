class Producto {
  Producto? producto;

  Producto({this.producto});

  Producto.fromJson(Map<String, dynamic> json) {
    producto = json['producto'] != null
        ? new Producto.fromJson(json['producto'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.producto != null) {
      data['producto'] = this.producto!.toJson();
    }
    return data;
  }
}

