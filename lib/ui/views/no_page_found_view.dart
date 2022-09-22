import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoPageFoundView extends StatelessWidget {
  const NoPageFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Contactos: 3128956340',
          style: GoogleFonts.montserratAlternates(
            fontSize: 40,
            fontWeight: FontWeight.bold
          ),          
          )
        ),

    );
  }
}