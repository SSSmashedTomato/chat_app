import 'dart:ui';

import 'package:flutter/material.dart';

class BlurrImagePage extends StatelessWidget {
  const BlurrImagePage({Key? key, required this.body}) : super(key: key);
  final List<Widget> body;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
              image: AssetImage('images/rain.png'),
              fit: BoxFit.fill,
              opacity: 0.6)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          color: Colors.black.withOpacity(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: body,
          ),
        ),
      ),
    );
  }
}



              // ListView.builder(
              //     itemCount: body.length,
              //     itemBuilder: (BuildContext context, int index) {