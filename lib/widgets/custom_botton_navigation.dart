import 'package:admin_dashboard/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomBottonNavigation extends StatefulWidget {
  const CustomBottonNavigation({Key? key}) : super(key: key);

  @override
  State<CustomBottonNavigation> createState() => _CustomBottonNavigationState();
}

class _CustomBottonNavigationState extends State<CustomBottonNavigation> {
  int _paginaActual =0;

@override
  void initState() {
    Provider.of<ProductosProvider>(context,listen: false).getProductos();    
    //super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _paginaActual = index;
      switch (index) {
        case 0:
          _callNumber();
          break;
        case 1:
          initState();
          break;          
        case 2:
        _facebook();
        break;          
        default:
      }

    });
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Color.fromARGB(255, 80, 40, 3),
      backgroundColor:  Color.fromARGB(255, 255, 255, 254),
      unselectedItemColor: Color.fromARGB(255, 83, 41, 13),
      currentIndex: _paginaActual,
      onTap: _onItemTapped,  

   
      items: [
        BottomNavigationBarItem(
         icon: Icon(FontAwesomeIcons.phone,color: Color.fromARGB(255, 15, 15, 15), size: 16.0),
         label: 'Distribuidor'

        ),
        BottomNavigationBarItem(
         icon: Icon(FontAwesomeIcons.shop,color: Color.fromARGB(255, 10, 10, 10), size: 16.0),
         label: 'Productos' 
        ),
        BottomNavigationBarItem(
         icon: Icon(FontAwesomeIcons.facebook,color: Color.fromARGB(255, 7, 7, 7), size: 16.0), 
         label: 'Facebook'
        ),   

           
      ],
    );
  }
}
////////////////////////////////////////////////////////////////////////////
void _callNumber () async {
  String number = '3128956340';
  await FlutterPhoneDirectCaller.callNumber(number);
}
////////////////////////////////////////////////////////////////////////////
void _facebook () async{
    const url = 'https://m.facebook.com/profile.php?id=100021561636317';
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'No se puede abrir $url';
}
}
////////////////////////////////////////////////////////////////////////////
