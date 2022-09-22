import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {

  final Widget child;

  const CardContainer({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric( horizontal: 30 ),
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.all( 20 ),
          decoration: _createCardShape(),
          child: this.child,
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
    color: Color(0xff441c04 ),
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        color: Color.fromARGB(31, 184, 161, 161),
        blurRadius: 15,
        offset: Offset(25, 25),
      )
    ]
  );
}