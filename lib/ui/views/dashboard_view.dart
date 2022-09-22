import 'package:admin_dashboard/widgets/categories_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launch/flutter_launch.dart';



class DashboardView extends StatelessWidget {

const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Pedidos: 3128956340'),
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(Icons.whatsapp_outlined),
                onPressed: ()=> whatsAppOpen(),
                )
            ],
        ),
      body: Stack(
        children: [
        //Background(),
        _HomeBody()
        ],
      ),    
    );
  }

void whatsAppOpen() async {
    bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");

    if (whatsapp) {
      await FlutterLaunch.launchWhatsapp(
          phone: "0573128956340", message: "Estoy interezado en un artículo de la tienda Marron");
    } else {
      throw 'No se puede lanzar el servicio';
    }
  }

}
//////////////////////////////////////////////////////////

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
        CategoriesView(),
          
        ],
      ),

    );
  }
}


