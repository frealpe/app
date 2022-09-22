import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/widgets/Background.dart';
import 'package:admin_dashboard/widgets/page_title.dart';
import 'package:flutter/material.dart';

class CategoriaView extends StatelessWidget {

  final String categoria_id;
  
  CategoriaView({
    Key? key,
    required this.categoria_id
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(categoria_id);
    return ChangeNotifierProvider(

      create: (_) => ProductosProvider(),
      child: _Productos_view(uid:categoria_id),
    );
  }
}

class _Productos_view extends StatelessWidget {
  final String uid;
  const _Productos_view({
    Key? key, 
    required this.uid,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
  print(uid);
  final Productos_provider = Provider.of<ProductosProvider>(context);
  final Resul_prod=Productos_provider.getProduCate(uid);
  final productos = Productos_provider.productos;    

    return Scaffold(
       body: Stack(
        children:[
        Background(),
        PageTitle(),
        ]
      ),
    );
  }
}