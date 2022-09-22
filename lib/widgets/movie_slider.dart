import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/providers/providers.dart';
import 'package:flutter/material.dart';


class MovieSlider extends StatefulWidget {
  
  final List<Categoria> categoria;
  final String? title;
  final Function onNexPage;
  
  const MovieSlider(
    {Key? key,
     required this.categoria,
     this.title, 
     required this.onNexPage,
     }) : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      
      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent-500){
          widget.onNexPage();
      }

    });
  }
   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  } 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 360,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          
          if (this.widget.title != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(widget.title!,
                      style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.normal,
                            shadows:[Shadow(color:Color.fromARGB(136, 15, 15, 15), offset:Offset(1,2), blurRadius: 4 ) ]
                        )
                        ),
                ),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.categoria.length,
                itemBuilder: (_, int index) => _MovieCategoria(widget.categoria[index]),
              
                ),
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////
class _MovieCategoria extends StatelessWidget {
  final Categoria categoria;

  const _MovieCategoria(this.categoria);  
    
  @override
    Widget build(BuildContext context) {
    final productosProvider = Provider.of<ProductosProvider>(context,listen:false);

      return Container(
                    width: 130,
                    height: 190,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        GestureDetector(
                          //TODO HCAER LA NAVEGACION A TODOS LOS PRODUCTOS DE LA CATEGORIA ESCOGIDA
                            onTap: (){                                
                              productosProvider.getProduCate(categoria.id);
                            }, 
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: FadeInImage(
                            placeholder: AssetImage ('assets/no-image.jpg'),
                            image: NetworkImage(categoria.img!),     
                            width: 130,
                            height: 190,
                            fit: BoxFit.cover),
                          ),
                        ),

                        SizedBox(height: 5,),
                          Text(
                          categoria.nombre,
                          style: TextStyle(
                          color: Color.fromARGB(255, 116, 69, 9),
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          shadows:[Shadow(color:Color.fromARGB(136, 15, 15, 15), offset:Offset(1,2), blurRadius: 4 ) ]
                           
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,)
                      ],
                    ),
                  );
    }
  }

//////////////////////////////////////////////////////////////////////


  
