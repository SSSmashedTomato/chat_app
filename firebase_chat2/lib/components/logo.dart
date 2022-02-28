import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo(
      {Key? key,
      required this.width,
      required this.height,
      required this.radius,
      required this.opacity})
      : super(key: key);
  final double width;
  final double height;
  final double radius;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        shape: BoxShape.rectangle,
        color: Color.fromARGB(255, 255, 255, 255).withOpacity(opacity),
      ),
      child: const Padding(
        padding: EdgeInsets.all(2.0),
        child: Image(
          image: AssetImage('images/giri.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
