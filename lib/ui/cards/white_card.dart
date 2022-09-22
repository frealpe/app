import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


//////////////////////////////////////////////////////////////////////////////
class WhiteCard extends StatelessWidget {

  final String? title;
  final Widget child; 
  final double? width;
  final double? height;
  final bool visible;
  const WhiteCard({
    Key? key,
    this.title,
    required this.child, 
    this.width,
    this.height,
    this.visible=true,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 500),

      child: Container(
        width: width != null ? width:null,
        height: height!= null ? height:null,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(10),
        decoration: buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(title != null)
            ...[
              FittedBox(
              fit: BoxFit.contain,
              child: Text(
                title!,
                style: GoogleFonts.roboto(
                  fontSize:15,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Divider()
            ],
            child
          ]
          
          ),


      ),        
        
        )

    );
  }
//////////////////////////////////////////////////////////////////////////////
  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 5
      )
    ]
  );
}
//////////////////////////////////////////////////////////////////////////////