import 'package:flutter/material.dart';


class ProductSearchDelegate extends SearchDelegate{

  @override
  // TODO: implement searchFieldDecorationTheme
  String? get searchFieldLabel => 'Buscar artículo';
  
//////////////////////////////////////////////////////////////////////////////  
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return[
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => query ='',
        )
    ]; 
  }
//////////////////////////////////////////////////////////////////////////////
  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
          close(context, null);
      }, 
      );
  }
//////////////////////////////////////////////////////////////////////////////
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('buildResults');
  }
//////////////////////////////////////////////////////////////////////////////
Widget emptyContainer(){
  return Container(
        child: Center(
          child: Icon(Icons.movie_creation_outlined,color: Colors.black38,size: 130,),
          ),
      );
}

//////////////////////////////////////////////////////////////////////////////
  @override
  Widget buildSuggestions(BuildContext context) {
 
    if(query.isEmpty){
      return emptyContainer();
    }

   return  Busqueda(query:query);
    
  }
//////////////////////////////////////////////////////////////////////////////

}

//////////////////////////////////////////////////////////////////////////////
class Busqueda extends StatelessWidget {

  final String query;

  const Busqueda({super.key, 
  required this.query
  });
  @override
  Widget build(BuildContext context) {

    return Container();
}
/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////

}