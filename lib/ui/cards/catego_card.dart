import 'package:admin_dashboard/models/producto.dart';
import 'package:admin_dashboard/providers/producto_form_provider.dart';
import 'package:admin_dashboard/providers/providers.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CategoCard extends StatefulWidget {


 final String? title;
 final String? estad;
  
  const CategoCard({
    Key? key,
    this.title='',
    this.estad,
    }): super(key: key);

  @override
  State<CategoCard> createState() => _CategoCardState();
}

class _CategoCardState extends State<CategoCard> {

List <Categoriap> categoriaprod = [];

Categoriap? categoid;

String? selectedValue;
/////////////////////////////////////////////////////////////////////////////////////////////////
@override
  void initState() {
  super.initState();
  categoriaprod.clear();

    Provider.of<CategoriesProvider>(context,listen: false).getCategories()
    .then((catgeid) {

    for (var i=0;i<catgeid.length;i++){ 
            categoid = Categoriap(id: (catgeid[i].id).toString(), nombre: (catgeid[i].nombre).toString());
            categoriaprod.add(categoid!); 
      }

    });

     setState((){categoriaprod;});   



  }

/////////////////////////////////////////////////////////////////////////////////////////////////
@override
Widget build(BuildContext context) {

  final categoriaFormProvider = Provider.of<ProductoFormProvider>(context);
  final categorias = Provider.of<CategoriesProvider>(context).categorias;

  return ConstrainedBox(
    constraints: BoxConstraints( maxWidth: 500 ),
    child: Container(
      child: Form(
        //key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
  
              DropdownButtonFormField2(
                decoration: InputDecoration(
    
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
  
                ),
                isExpanded: true,
                hint: Text(
                  '${widget.title}',
                  style: TextStyle(fontSize: 14),
                ),
                  
  
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
                buttonHeight: 60,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                items: categorias
                        .map((item) =>
                        DropdownMenuItem<String>(
                          value: item.nombre,
                          child: Text(
                            item.nombre,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                        .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Seleccione una categoria.';
                  }
                },
                onChanged: (value) {
                selectedValue = value.toString();                
                final categoid = categoriaprod.singleWhere((categoid) =>categoid.nombre == selectedValue);               
                categoriaFormProvider.copyProductoWith( categoria: categoid);

                },
                onSaved: (value) {
                    selectedValue = value.toString();
  
                },
              ),
  
            ],
          ),
        ),
      ),
    ),
  );
}
}
/////////////////////////////////////////////////////////////
